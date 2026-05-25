# AI Tools for Business and Information Technology

**Read the live book:** https://aitoolsforbusiness.org

An open textbook for VCCS **ITE 142 — AI Tools for Business and IT**, by Benjamin Lamb, PhD. Currently in **public beta**: the full manuscript is available as a Quarto web book, PDF, and EPUB for review, classroom piloting, and adaptation.

## Who this is for

- **Students and self-learners** — read free online at the link above, or download a PDF or EPUB for offline use.
- **Instructors considering adoption** — the book itself is openly licensed (see below). Optional instructor supplements (slides, Canvas shell, test banks, solution keys) are sold separately.
- **Contributors** — file an issue or open a pull request if you spot errors, dead links, or have suggestions.

## OER and licensing transparency

This project deliberately separates the open textbook from the paid instructor package:

| Component | License | Cost |
|---|---|---|
| Textbook web book, PDF, EPUB, chapter source | **CC BY 4.0** (open) | Free |
| Instructor supplements — slides, Canvas course shell, test banks, lab solution keys, pacing/implementation guide | **All rights reserved** | Paid (in development) |

This split follows the common OER pattern used by OpenStax and similar projects: the student-facing content is genuinely open and free, and the instructor package is a separate commercial work that funds ongoing maintenance.

You may share, adapt, remix, and redistribute the **textbook text** for any purpose — including commercial — as long as you give appropriate credit, link to the license, and indicate any changes you made.

**Suggested attribution:**

> *AI Tools for Business and Information Technology* by Benjamin Lamb, PhD is licensed under CC BY 4.0. Source: https://github.com/benlambm/ai-tools-for-business

Full terms: [LICENSE](LICENSE) (textbook) and [LICENSE-SUPPLEMENTS.md](LICENSE-SUPPLEMENTS.md) (supplements).

## Instructor supplements (paid, in development)

The following are **not** in this repository and are sold separately:

- Lecture slide decks (`.pptx`)
- Canvas course shell as IMS Common Cartridge (`.imscc`)
- Test banks and quiz pools
- Lab solution keys and grading rubrics
- Pacing guide and implementation notes

To be notified at launch or request early access, contact the author via the repository's [Issues](https://github.com/benlambm/ai-tools-for-business/issues) tab or email.

## What's in this repository

- `index.qmd` — preface and reader's guide
- `01-customer-service.qmd` … `09-product-design.qmd` — Chapters 1–9
- `appendix-ai-assisted-workflow.qmd` — documents the AI-assisted authoring workflow
- `labs/` — lab assets and starter files
- `images/` — figure assets
- `scripts/` — local and CI build helpers
- `_quarto.yml`, `netlify.toml` — build configuration

## Build locally

Install [Quarto](https://quarto.org), then render:

```bash
scripts/render-local.sh
```

The HTML book is written to `_book/`. Portable formats:

```bash
scripts/render-local.sh --to typst   # PDF via Typst — no LaTeX install required
scripts/render-local.sh --to epub
```

## Status

Public beta, tagged `v0.2.0-beta`. Issues and pull requests are welcome — small fixes (typos, broken links, factual corrections) are especially appreciated.
