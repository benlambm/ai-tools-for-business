# Source Manifest

This directory tracks source metadata for the public-beta textbook.

The textbook currently uses a mix of embedded hyperlinks and emerging bibliography entries. The long-term goal is to make significant claims easier to audit by combining:

- inline citations or links in the chapter text;
- `references.bib` entries for major recurring sources;
- a source manifest that records source type, chapter use, review status, volatility, and editorial notes.

## Why this exists

AI-related textbook claims age quickly. Product names, model features, regulatory timelines, pricing, adoption statistics, and vendor claims can change within a semester. A source manifest gives the project a lightweight way to track which sources are stable, which are time-sensitive, and which need review before a stable release.

This is not meant to replace citations. It is an editorial maintenance layer.

## Source quality posture

The book prefers sources in roughly this order:

1. government data, standards, audits, and official regulatory documents;
2. public company filings and formal investor disclosures;
3. peer-reviewed or otherwise empirical research;
4. court records and legal/regulatory decisions;
5. reputable journalism;
6. product documentation;
7. vendor case studies, vendor blog posts, and consultancy reports.

Vendor documentation can be appropriate when the claim is about what a product says it does. Vendor case studies and consultancy reports should be treated as promotional unless independently supported.

## Volatility levels

The manifest uses practical volatility labels:

- `low`: unlikely to change often, such as a published standard, court decision, or historical incident;
- `medium`: may need periodic review, such as annual reports, public company filings, or research summaries;
- `high`: likely to change frequently, such as product features, model names, AI tool capabilities, pricing, and regulatory implementation timelines.

High-volatility sources should be reviewed before major releases and before broad adoption outreach.

## Review status values

Recommended status values:

- `seeded`: source has been added to the manifest but not fully reviewed;
- `verified`: source supports its associated claim as currently written;
- `needs_review`: source or claim should be checked before the next release;
- `replace_candidate`: a stronger source should be found;
- `stale`: source or claim is outdated;
- `removed`: source was removed from active use but retained for audit history.

## Adding a source

When adding a source to `source-index.yml`, include:

- a stable `source_id`;
- the matching `citation_key` from `references.bib`, if one exists;
- the source type;
- the URL;
- the chapters or files where it is used;
- the claim area it supports;
- source posture notes;
- volatility;
- review status;
- date reviewed.

Keep URLs clean. Remove tracking parameters such as `utm_source`, `utm_medium`, and `utm_campaign` unless they are genuinely necessary for access.

## Relationship to `references.bib`

Use `references.bib` for formal citations and bibliographic metadata. Use the manifest for editorial tracking.

A source can appear in the manifest before it appears in `references.bib`, but major recurring sources should eventually be represented in both places.