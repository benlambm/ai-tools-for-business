# Phase 0 — style comparison

Run from the book root after API keys are set in `~/.env`:

- `OPENAI_API_KEY`
- `GEMINI_API_KEY` (or `GOOGLE_API_KEY`)

```bash
scripts/phase0-gen.zsh
```

Uses every **configured** provider (Gemini-only is fine; OpenAI is optional). With both keys set you get six drafts under `images/_drafts/01/`:

- `hero.openai.v1.png`, `hero.gemini.v1.png`
- `agent-assist.openai.v1.png`, `agent-assist.gemini.v1.png`
- `alert-noise.openai.v1.png`, `alert-noise.gemini.v1.png`

With only Gemini, you get three drafts (`*.gemini.v1.png`).

Pick a visual direction, update `images/STYLE.md`, commit the style lock, then proceed with full chapter generation.

**Status (2026-05-25):** Generation not yet run — OpenAI returned `billing_hard_limit_reached`; `GEMINI_API_KEY` not in `~/.env`. Pipeline and specs are ready; re-run `scripts/phase0-gen.zsh` when billing and Gemini access are available.
