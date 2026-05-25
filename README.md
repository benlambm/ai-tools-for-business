# AI Tools for Business and Information Technology

This repository contains the Quarto source for an open textbook aligned to VCCS ITE 142, with the initial scaffold converted from the 2026-05-25 Word compilation.

## Current scope

- `index.qmd`: preface converted from the Word compilation.
- `01-customer-service.qmd`: Chapter 1 converted to Quarto Markdown.
- `labs/`: future lab assets and starter files.
- `images/`: future image assets.

## Build locally

Install Quarto, then render:

```bash
quarto render
```

If Quarto is not installed globally on this Mac, use the local extracted executable from the bootstrap run:

```bash
/Users/benlamb/BookProjects/.toolcache/quarto-pkg/quarto-core.pkg/Payload/bin/quarto render
```

The HTML book is written to `_book/`.

## License

The textbook text is licensed under Creative Commons Attribution 4.0 International (`CC BY 4.0`). Instructor-only supplements, if created, are separate works and are not licensed under `CC BY 4.0` unless explicitly marked that way.
