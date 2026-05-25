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

## Remaining Work

1. Verify the public beta render across HTML, PDF, and EPUB.
2. Move reusable hands-on materials, datasets, starter files, and rubrics into `labs/` when they are separated from chapter prose.
3. Add useful, licensed, or original images to `images/` and reference them from chapters.
4. Add a short accessibility statement before catalog submission.
5. Keep `CHANGELOG.md`, `CITATION.cff`, and documentation current as the book approaches `v1.0.0`.
