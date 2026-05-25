# AI Tools for Business and Information Technology

This repository contains the Quarto source for an open textbook aligned to VCCS ITE 142, with the initial scaffold converted from the 2026-05-25 Word compilation.

## Public Beta Status

This repository is being prepared for a public beta OER launch, not a final v1.0 release. The beta makes the complete converted manuscript available as a Quarto web book, PDF, and EPUB for review, classroom piloting, and portability testing.

The recommended release stance is to keep the GitHub repository private until the beta checklist is complete, then make the repository public and tag a prerelease such as `v0.2.0-beta`.

Instructor supplements are separate from the open textbook source and are not included in this repository.

## Current scope

- `index.qmd`: preface converted from the Word compilation.
- `01-customer-service.qmd` through `09-product-design.qmd`: Chapters 1-9 converted to Quarto Markdown.
- `appendix-ai-assisted-workflow.qmd`: appendix documenting the AI-assisted chapter development workflow.
- `labs/`: future lab assets and starter files.
- `images/`: future image assets.

## Build locally

Install Quarto, then render:

```bash
scripts/render-local.sh
```

If Quarto is not installed globally on this Mac, use the local extracted executable from the bootstrap run:

```bash
scripts/render-local.sh
```

The HTML book is written to `_book/`. The configured portable formats are also written there:

```bash
scripts/render-local.sh --to typst
scripts/render-local.sh --to epub
```

The `typst` format produces the beta PDF without requiring a local LaTeX installation.

## License

The textbook text is licensed under Creative Commons Attribution 4.0 International (`CC BY 4.0`). Instructor-only supplements, if created, are separate works and are not licensed under `CC BY 4.0` unless explicitly marked that way.

Suggested attribution:

> AI Tools for Business and Information Technology by Benjamin Lamb, PhD is licensed under CC BY 4.0.

When reusing or adapting the book, include the title, author, license, and a link to the source repository or public book site when available. Mark any changes you make.
