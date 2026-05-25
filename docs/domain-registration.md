# Domain Registration

Checked by RDAP on 2026-05-25 at 09:35 EDT.

## Recommended domain

Register `aitoolsforbusiness.org`.

The `.org` domain is short, readable, and matches the open-textbook purpose better than `.com`.

## RDAP check results

- `aitoolsforbusiness.org`: no RDAP registration object returned.
- `aitoolsforbusiness.com`: registered on 2024-02-15 and expires on 2027-02-15.
- `aitoolsforbusiness.net`: no RDAP registration object returned.
- `aitoolsforbusiness.education`: no RDAP registration object returned.
- `ai-tools-for-business.org`: no RDAP registration object returned.
- `ai-tools-for-business.com`: no RDAP registration object returned.

Treat RDAP availability as a strong signal, not a checkout guarantee. Verify again at the registrar before purchasing.

## Registration path

1. Register `aitoolsforbusiness.org` at the registrar of choice.
2. Create or connect the Netlify site for this repository.
3. Add `aitoolsforbusiness.org` in Netlify domain settings.
4. Follow Netlify's DNS instructions. If Netlify DNS is used, change the registrar nameservers to Netlify's assigned nameservers. If external DNS is used, add the records Netlify provides.
5. Wait for Netlify to issue the TLS certificate before public launch.

## Current setup

The domain was purchased at Porkbun and added to the Netlify project `ai-tools-for-business`.

Use Porkbun DNS with:

- `A` record for `@` pointing to `75.2.60.5`
- `CNAME` record for `www` pointing to `ai-tools-for-business.netlify.app`
