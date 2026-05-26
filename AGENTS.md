# Agent Notes

This is a Quarto book project for **AI Tools for Business and Information Technology**, aligned to ITE 142.

## Current State

- `index.qmd` contains the converted Preface.
- `01-customer-service.qmd` through `09-product-design.qmd` contain the converted Chapters 1 through 9.
- `appendix-ai-assisted-workflow.qmd` contains the AI-assisted chapter development workflow appendix.
- `_quarto.yml` is configured for the public beta web book plus PDF and EPUB outputs.
- `labs/` exists for hands-on lab files but only has a placeholder.
- `images/` exists for book images but only has a placeholder.
- No image assets have been added yet.

## Local Build

Render with:

```bash
scripts/render-local.sh
```

The rendered HTML book is written to `_book/`, which is ignored by Git.

## Deployment

Netlify is connected to the GitHub repo `benlambm/ai-tools-for-business`.

- Production branch: `main`
- Build command: `bash scripts/install-quarto-netlify.sh && ./.quarto-bin/quarto render`
- Publish directory: `_book`
- Netlify project: `ai-tools-for-business`
- Production domain: `aitoolsforbusiness.org`
- Domain alias: `www.aitoolsforbusiness.org`

Every push to `main` should trigger a Netlify production deploy.

## Author and Strategic Direction

The developer-user for this repo is the author: **Professor Benjamin Lamb** (GitHub: `benlambm`). All "user," "owner," or "developer" references in agent contexts refer to him. This is his open textbook, not a team project.

Strategic goals he is actively exploring, roughly ordered by priority:

1. **Educational images throughout — MAJOR PRIORITY.** Generate and embed AI-generated diagrams, illustrations, and figures at appropriate spots in every chapter. Currently `images/` has only a placeholder and no chapter contains figures. Agents should treat image generation and embedding as a first-class concern, with accessibility (alt text, captions) included from the start.
2. **Per-chapter endnote citations.** The manuscript currently uses embedded hyperlinks inconsistently. Move to a proper citation system — BibTeX (`references.bib`) plus Quarto's native citation handling — with endnotes or a references section at the end of each chapter.
3. **Automated content-update workflow.** Define scope, then build an on-demand or scheduled agent pass that refreshes AI-tool references, pricing claims, model names, and capability statements, since the underlying tools shift quickly.
4. **Paid e-commerce for Instructor / Institution deployments.** Sold separately from the open textbook: slide decks, Canvas `.imscc` course shell, test banks, lab solution keys, pacing/implementation guide. See `docs/publishing-notes.md` for the license boundary.
5. **Interactive code snippets and dynamic playgrounds in the Netlify HTML edition.** Quarto Live (Pyodide-based, in-browser Python) or embedded sandboxes for the HTML version, while keeping the PDF and EPUB editions self-contained.

## Image pipeline

Shared CLI package: `~/BookProjects` (`pip install -e` via `.venv` there). Plan: `~/BookProjects/docs/image-pipeline-plan.md`.

```bash
scripts/imagegen.zsh providers
scripts/imagegen.zsh gen 01 hero              # gemini-only OK if no OpenAI key
scripts/imagegen.zsh scaffold --all --density rich-bounded
scripts/imagegen.zsh illustrate --all --density rich-bounded --publish-failed --render
scripts/imagegen.zsh review
scripts/imagegen.zsh remove 01 hero
scripts/imagegen.zsh lint 01
```

Config: `imagegen.book.yaml`. Style prefix: `images/STYLE.md`. Drafts: `images/_drafts/` (gitignored). Bulk illustration inserts managed Quarto figure blocks and writes `_book/image-review.html` for visual cleanup.

## Remaining Work

1. Verify the public beta render across HTML, PDF, and EPUB.
2. Move reusable hands-on materials, datasets, starter files, and rubrics into `labs/` when they are separated from chapter prose.
3. Add useful, licensed, or original images to `images/` and reference them from chapters (see priority 1 above).
4. Add a short accessibility statement before catalog submission.
5. Keep `CHANGELOG.md`, `CITATION.cff`, and documentation current as the book approaches `v1.0.0`.
