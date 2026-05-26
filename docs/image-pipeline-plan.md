# Image pipeline

The canonical plan and shared tooling live in the **BookProjects** workspace:

- Plan: [`~/BookProjects/docs/image-pipeline-plan.md`](../../docs/image-pipeline-plan.md)
- Install and CLI: [`~/BookProjects/AGENTS.md`](../../AGENTS.md)

From this book directory:

```bash
scripts/imagegen.zsh gen 01 hero --providers openai gemini
scripts/imagegen.zsh lint 01
scripts/imagegen.zsh scaffold --all --density rich-bounded
scripts/imagegen.zsh illustrate --all --density rich-bounded --publish-failed --render
scripts/imagegen.zsh review
scripts/imagegen.zsh remove 01 hero
```

Book-specific config: [`imagegen.book.yaml`](../imagegen.book.yaml). Style lock: [`images/STYLE.md`](../images/STYLE.md).

Bulk illustration scaffolds specs from chapter headings, generates and evaluates
drafts, promotes the selected image, inserts managed Quarto figure blocks, and
writes `_book/image-review.html` for cleanup after rendering.
