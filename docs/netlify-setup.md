# Netlify Setup

The repository is ready for Netlify builds through `netlify.toml`.

## Build settings

- Build command: `bash scripts/install-quarto-netlify.sh && ./.quarto-bin/quarto render`
- Publish directory: `_book`
- Production branch: `main`

## CLI setup

From the repository root:

```bash
npx netlify login
npx netlify init
```

Use the GitHub repository `benlambm/ai-tools-for-business` when connecting the site.

## Suggested site name

Use `ai-tools-for-business` if it is available. Netlify will assign a temporary `*.netlify.app` domain until a custom domain is registered and connected.

## Custom domain later

After purchasing a domain, add it in Netlify under domain settings and follow Netlify's DNS instructions for the registrar you choose.
