# Netlify Setup

The repository is connected to Netlify continuous deployment.

## Site

- Netlify project: `ai-tools-for-business`
- Netlify project ID: `c38a23d6-0933-4368-abe9-1e49c5892ed8`
- Netlify URL: `https://ai-tools-for-business.netlify.app`
- Production domain: `https://aitoolsforbusiness.org`
- Domain alias: `https://www.aitoolsforbusiness.org`
- GitHub repository: `benlambm/ai-tools-for-business`
- Production branch: `main`

## Build settings

- Build command: `bash scripts/install-quarto-netlify.sh && ./.quarto-bin/quarto render`
- Publish directory: `_book`
- Production branch: `main`

Every push to `main` should trigger a production build.

## CLI status

From the repository root:

```bash
npx netlify status
```

## Porkbun DNS records

Keep DNS hosted at Porkbun unless there is a separate reason to move nameservers to Netlify DNS.

In Porkbun DNS for `aitoolsforbusiness.org`, create or update these records:

| Type | Host | Answer/Value | Notes |
| --- | --- | --- | --- |
| A | `@` | `75.2.60.5` | Apex/root domain for `aitoolsforbusiness.org`. |
| CNAME | `www` | `ai-tools-for-business.netlify.app` | `www.aitoolsforbusiness.org` alias. |

Remove conflicting `A`, `AAAA`, `ALIAS`, `ANAME`, or `CNAME` records for `@` or `www` if Porkbun added parking/default records.

After DNS propagation, Netlify should verify the domain and issue TLS automatically.

## CLI setup from scratch

From the repository root:

```bash
npx netlify login
npx netlify init
```

Use the GitHub repository `benlambm/ai-tools-for-business` when connecting the site.

## Suggested site name

Use `ai-tools-for-business` if it is available. Netlify will assign a temporary `*.netlify.app` domain until a custom domain is registered and connected.
