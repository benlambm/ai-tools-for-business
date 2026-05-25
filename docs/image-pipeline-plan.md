# Plan: Educational Image Pipeline

A handoff document for executing the image-generation work in a fresh Claude Code session. A new agent should read `AGENTS.md` and this file, then start at Phase 0.

## Context

- **Author / sole developer:** Professor Benjamin Lamb (GitHub: `benlambm`).
- **Repo:** `~/BookProjects/ai-tools-for-business`
- **Live site:** https://aitoolsforbusiness.org (Netlify, auto-deploys from `main`)
- **Stack:** Quarto book → HTML + PDF (via Typst) + EPUB. See `docs/how-it-works.md`.
- **Status:** Public beta `v0.2.0-beta`. Nine chapters, no images yet — `images/` contains only a placeholder.
- **License:** Textbook content is `CC BY 4.0`. Generated images become part of the open textbook and inherit the same license; do not generate anything that could conflict.

## Goal

Build a multi-provider image-generation pipeline that produces a consistent set of accessibility-compliant illustrations across all nine chapters, then use it to generate and embed images chapter by chapter.

## Hard constraints

These are not negotiable:

1. **No embedded text in any image.** No letters, words, numbers, captions, labels, signs, logos, or readable symbols inside the generated image. Captions and alt text live in the Quarto `.qmd`, not baked into the pixels. This is both an accessibility requirement (screen readers cannot reach pixel text) and a quality requirement (image models are unreliable at rendering text).
2. **Every figure has an explicit `fig-alt` attribute and a caption.** No exceptions. UDOIT, WCAG, and screen readers depend on it.
3. **Multi-provider with easy switching.** The pipeline must support OpenAI (`gpt-image-1`) and Google (Imagen via the Gemini API) as first-class providers, with a clean abstraction so a third provider (Stable Diffusion via Replicate, etc.) can be added later.
4. **Parallel-call mode.** A single command must be able to call both providers on the same prompt and save both outputs side-by-side for visual comparison and selection. This is the primary mode of working during Phase 0 and the early chapters.
5. **No essential information conveyed by color alone.** Some readers are colorblind; some PDF/EPUB renderings shift colors. Concept must be readable in greyscale.
6. **API keys via environment variables only.** Per the user's `CLAUDE.md`, keys live in `~/.env` (auto-sourced by `.zshrc`). Never hardcode.

## Visual identity — starting defaults (revisable in Phase 0)

- **Style:** flat editorial illustration. Not photoreal. Not 3D-rendered. Not cartoony.
- **Palette:** 2–3 colors. Starting suggestion: warm coral + cool teal on a light cream background, harmonizing with the Quarto Cosmo HTML theme. Final palette locked in Phase 0.
- **Composition:** clean geometric shapes, soft edges, subtle gradients, generous negative space.
- **Per chapter:** 1 hero / opener image + 2–4 in-chapter figures. Optional 1–2 inline spot illustrations.
- **Aspect ratios:**
  - Hero / chapter opener: **16:9**
  - In-chapter figures: **4:3**
  - Inline spot illustrations: **1:1**
- **Target across the book:** roughly 40–50 images total.

## Phases

### Phase 0 — Lock visual identity (~one afternoon)

Do not generate the full book's worth of images. The goal is to confirm a single style direction first.

1. Stand up the pipeline skeleton (see Phase 1) just enough to call both providers.
2. Pick three concept prompts from Chapter 1 — e.g., the chapter hero, an agent-assist scene, an IT-operations alert-noise visualization.
3. Generate each one from both providers in parallel.
4. Show the six outputs to Ben. He picks the direction.
5. Write the locked style fragment to `images/STYLE.md` — the canonical prompt prefix every later generation will use.
6. **Commit the style lock before generating anything further.** Treat this as a release gate.

### Phase 1 — Build the pipeline (one to two evenings)

**Dependencies (Python 3.13 via Homebrew):**

- `openai` (Python SDK)
- `google-genai` (the newer unified Gemini SDK; supports Imagen image generation)
- `Pillow`
- `python-dotenv`
- `pyyaml`
- `click` (for the CLI)

**Package layout:**

```
scripts/imagegen/
  __init__.py
  cli.py                  # click-based entry point
  providers/
    __init__.py
    base.py               # abstract Provider
    openai_provider.py    # wraps gpt-image-1
    gemini_provider.py    # wraps Imagen via google-genai
  spec.py                 # YAML loader + validation
  emit.py                 # markdown figure-block writer
  prompts.py              # style prefix loader, no-text guard
images-spec/
  01-customer-service.yaml
  02-data-analytics.yaml
  ...
images/
  STYLE.md                # canonical style spec
  _drafts/                # generated outputs by provider+version (gitignored except final)
    01/hero.openai.v1.png
    01/hero.gemini.v1.png
  01/
    hero.png              # promoted winner — referenced by 01-customer-service.qmd
```

**Provider interface:**

```python
class Provider(ABC):
    name: str
    @abstractmethod
    def generate(self, prompt: str, aspect: str, seed: int | None = None) -> bytes: ...
```

Concrete providers handle their own API quirks (size strings, response formats, content-safety reasons). Caller always gets bytes and writes them to disk.

**CLI shape:**

```
imagegen gen <chapter> <slug>          # generate one figure, default provider
imagegen gen <chapter> --all           # generate every spec for a chapter
imagegen gen <chapter> <slug> --providers openai gemini   # parallel mode
imagegen promote <chapter> <slug> --provider openai --version 1
imagegen emit <chapter>                # print figure-block markdown for paste
imagegen lint <chapter>                # validate spec yaml + check no missing alt text
```

**Critical guardrails inside the pipeline:**

- Every prompt is auto-prefixed with the locked style fragment AND a "no-text" guard string. The "no-text" guard goes at the END of the prompt because both image models weight terminal instructions heavily:
  > "Do not include any text, letters, words, numbers, signs, logos, watermarks, or readable symbols anywhere in the image."
- Generated files are NEVER overwritten — each run produces a new versioned file under `images/_drafts/`. The `promote` step is the only thing that writes to the canonical `images/<chapter>/<slug>.png` path.
- Each call logs its provider, prompt, model version, seed, and output path to `images/_drafts/_log.jsonl`. Lets Ben reproduce or audit later.
- The CLI prints an estimated cost before any `--all` run and refuses if `IMAGEGEN_DAILY_CAP_USD` is exceeded.

**Spec YAML shape (one file per chapter):**

```yaml
chapter: 01-customer-service
hero:
  slug: hero
  prompt: "A small support team using AI tools at workstations, soft ambient lighting, three figures focused on screens showing abstract chat-bubble shapes."
  alt: "Three support representatives at curved desks looking at screens displaying abstract chat-bubble icons in a calm office environment."
  caption: "Customer service and IT support are full of language work — the kind of work AI tools can assist with."
  aspect: "16:9"
figures:
  - slug: triage-flow
    prompt: "A stylized funnel diagram of incoming support requests being sorted into three lanes, abstract not literal..."
    alt: "Funnel illustration showing incoming requests split into three labeled lanes representing classification, routing, and response."
    caption: "Conceptual flow of how AI-assisted ticket triage routes incoming requests."
    aspect: "4:3"
  - ...
```

Per the no-text rule, alt text describes the *image content* — but if the prose explains "three lanes representing classification, routing, response," the alt text is allowed to reference those concepts because they live in the prose and caption, not in pixel text.

**Environment:**

Add to `~/.env` (already auto-sourced):

```
OPENAI_API_KEY=sk-...
GEMINI_API_KEY=...
IMAGEGEN_DAILY_CAP_USD=5
```

Project-local `.env` is also supported (gitignored). Repo `.gitignore` must include `.env`, `images/_drafts/`, and `images/_drafts/_log.jsonl`.

### Phase 2 — Per-chapter spec drafting

For each chapter, before generating images:

1. Read the chapter prose.
2. Draft a `images-spec/<chapter>.yaml` with the hero + 2–4 figures.
3. For each figure, write: slug, prompt (visual content), alt text (literal description), caption (pedagogical framing), aspect.
4. Run `imagegen lint <chapter>` to validate.
5. Commit the spec **first**. Image generation is a separate step.

This separation matters because prompt iteration is cheaper than API calls. Refine the YAML until the descriptions read well to a human, then spend money generating.

### Phase 3 — Generate, review, embed

Per chapter:

1. `imagegen gen <chapter> --all --providers openai gemini` (parallel both providers, ~6–10 images).
2. Open `images/_drafts/<chapter>/` in Finder, eyeball outputs side-by-side. Reject anything with sneaky text, color confusion, or off-style. Regenerate failures with prompt tweaks.
3. `imagegen promote <chapter> <slug> --provider <winner> --version <n>` for each accepted image.
4. `imagegen emit <chapter>` to print the Quarto figure blocks. Paste them into the `.qmd` at the right anchor points.
5. `scripts/render-local.sh` to verify HTML renders. Spot-check the PDF (Typst path) and EPUB.
6. Commit the chapter — one chapter per commit so rollback is easy if an image is later contested.

Plan ~half a day per chapter for review and revision. Generation is fast; curation is slow.

## Quarto figure block format

The `emit` command produces blocks like:

```markdown
![Conceptual flow of how AI-assisted ticket triage routes incoming requests.](images/01/triage-flow.png){#fig-triage-flow fig-alt="Funnel illustration showing incoming requests split into three labeled lanes representing classification, routing, and response." width="80%"}
```

Notes:

- `fig-alt` is **mandatory** — never omit. Quarto will warn but not fail; the linter will fail.
- Cross-references work via `@fig-triage-flow` in prose.
- `width="80%"` is a sensible default for in-chapter figures; heroes may use `width="100%"`.

## First step in a fresh session

A new agent should:

1. Read `AGENTS.md` and this file end to end.
2. Confirm Python 3.13 and the dependencies above are installed (Homebrew + `pip3 install` as needed).
3. Confirm `OPENAI_API_KEY` and `GEMINI_API_KEY` are set in env (don't print them — just check `[[ -n "${OPENAI_API_KEY:-}" ]]`).
4. Scaffold `scripts/imagegen/` with the package layout above.
5. Draft `images/STYLE.md` with the starting style direction from this plan as a placeholder — note that Phase 0 will refine it.
6. Generate three test images for Chapter 1 hero from both providers (six images total) using the starting style prefix.
7. Show Ben the six outputs. Wait for his pick before doing anything else.

**Do not** generate the full book's images in the first session. The style lock is a release gate.

## Out of scope (intentionally)

- Citation system migration to BibTeX — decided against. Embedded hyperlinks stay; they're convenient and disposable as sources age.
- Interactive playgrounds.
- Instructor e-commerce.
- Automated content updates.
- Lab content generation.

Anything in this list that comes up during the work goes into a follow-up task chip, not into scope creep.

## What "done" looks like

- `images/STYLE.md` exists and matches the live aesthetic of every committed image.
- All nine chapters have a hero + 2–4 in-chapter figures, every figure has alt text and a caption, no figure contains embedded text.
- HTML, PDF, and EPUB renders all succeed and look good.
- The pipeline scaffolding is generic enough to support future chapters or a v2 edition without rework.
- A new tag `v0.3.0-beta` cuts a release of the illustrated book.
