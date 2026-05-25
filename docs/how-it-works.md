# How It Works

Reference for the build and deploy pipeline. Useful when something breaks or when explaining the stack to a collaborator.

## The pipeline, end to end

```
git push origin main
  ↓
GitHub (storage only — no compute, no Actions)
  ↓ webhook
Netlify spins up a fresh Linux build container
  ↓ reads netlify.toml
bash scripts/install-quarto-netlify.sh    ← downloads the Quarto binary
  ↓
./.quarto-bin/quarto render                ← actual build
  ↓
Quarto walks _quarto.yml → renders each .qmd → writes _book/
  ↓
Netlify uploads _book/ to its CDN, swaps the live deploy
  ↓
aitoolsforbusiness.org serves the new version (~1–3 min after push)
```

GitHub stores. Netlify builds. There is no GitHub Actions workflow.

## Runtime layers on Netlify

1. **Bash** — runs the build command from `netlify.toml`.
2. **The install script** — downloads the pinned Quarto release (`QUARTO_VERSION` in `netlify.toml`) into `.quarto-bin/`. Cached between builds.
3. **The Quarto CLI** — a self-contained binary that bundles its own dependencies.

Inside the Quarto binary:

- **Pandoc** — written in **Haskell**, the universal document converter that does the Markdown-to-HTML/EPUB work. Not Python.
- **Typst** — written in **Rust**, used to produce the PDF without LaTeX.
- **Deno** — a JavaScript/TypeScript runtime, used internally by Quarto for its own scripting layer.

No Python, no Node, no R interpreters run on Netlify for this book — because no `.qmd` chapter contains executable code cells. If a future chapter adds executable Python cells, Quarto will need a Python interpreter available in the build container at that point.

## What I edit vs. what is generated

| Edit by hand | Generated, never edit |
| --- | --- |
| `*.qmd` chapter files | `_book/` |
| `_quarto.yml` | `_freeze/` (Quarto cache for executable cells) |
| `filters/*.lua` | `.quarto-bin/` (on Netlify only) |
| `netlify.toml` | |
| `scripts/*.sh` | |
| `images/`, `labs/` content | |

`_book/` is throwaway output. Delete it and re-render and the same thing comes back. It is in `.gitignore` and must not be committed.

## Build triggers and logs

- The push-to-deploy trigger is configured in the **Netlify dashboard**, not in this repo. Production branch is `main`.
- Deploy previews (PRs, other branches) are a Netlify setting — toggle there if desired.
- **Build logs live on Netlify**, under Deploys → click the deploy → "Deploy log." Failures are diagnosed there, not on GitHub.
- **Rollback** is one click in the Netlify dashboard. Every prior deploy is preserved.

## Local rendering

`scripts/render-local.sh` wraps `quarto render` for desktop builds. It expects Quarto installed globally (Homebrew: `brew install --cask quarto`). The Netlify install script is Linux-only and will refuse to run on macOS.

If a stale render shows up after editing, clear the Quarto cache:

```bash
rm -rf _freeze _book
scripts/render-local.sh
```

## Output formats

Configured under `format:` in `_quarto.yml`.

- **`html`** — the primary web book, theme `cosmo`. This is what aitoolsforbusiness.org serves.
- **`typst`** — PDF, routed through Typst. The custom Lua filter `filters/typst-chapter-titles.lua` adjusts chapter title rendering in this format.
- **`epub`** — e-reader format. Generally renders cleanly; tables and complex layouts can look uneven on Kindle/Kobo, so spot-check after major content changes.

PDF layout problems are fixed in the Typst path (Lua filter or Typst template), not in LaTeX.

## Mental model

1. Edit `.qmd` and `_quarto.yml`. Ignore everything in `_book/` and `_freeze/`.
2. Three deliverables (HTML, PDF, EPUB) come from one source.
3. Push to `main` → Netlify rebuilds. Local rendering is just for preview.
4. If a build breaks, the answer is in the Netlify deploy log.
