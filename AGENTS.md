# Agent Notes

This is a Quarto book project for **AI Tools for Business and Information Technology**, aligned to ITE 142.

## Current State

- `index.qmd` contains the converted Preface.
- `01-customer-service.qmd` contains the converted Chapter 1.
- Chapters 2 through 9 still need to be converted into:
  - `02-data-analytics.qmd`
  - `03-digital-marketing.qmd`
  - `04-fraud-security.qmd`
  - `05-supply-chain.qmd`
  - `06-human-resources.qmd`
  - `07-financial-forecasting.qmd`
  - `08-business-process-automation.qmd`
  - `09-product-design.qmd`
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

1. Convert Chapters 2-9 from the Word compilation into separate `.qmd` files.
2. Add the new chapter files to `_quarto.yml` in book order.
3. Move reusable hands-on materials, datasets, starter files, and rubrics into `labs/`.
4. Add useful, licensed, or original images to `images/` and reference them from chapters.
5. Re-render locally after each chapter conversion and check the generated HTML.
6. Keep `CHANGELOG.md`, `CITATION.cff`, and documentation current as the book approaches `v1.0.0`.

