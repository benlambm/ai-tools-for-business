# Contributing to AI Tools for Business and Information Technology

Thank you for helping improve **AI Tools for Business and Information Technology**. This project is a public-beta open textbook for introductory students learning how AI tools are being used in business, information technology, and related workplace settings.

The goal is not to chase every AI headline. The goal is to build a useful, accurate, teachable, openly licensed textbook that helps students reason about AI systems, business workflows, evidence, risk, and human responsibility.

## Project status

The book is currently in **public beta**. That means the complete manuscript is available for reading, classroom piloting, accessibility review, source review, and adaptation testing, but it is still moving toward a stable `v1.0.0` release.

Useful beta feedback includes factual corrections, broken links, unclear explanations, accessibility issues, missing source information, lab improvements, and suggestions for educational figures.

## License boundary

The student-facing textbook is licensed under **Creative Commons Attribution 4.0 International (CC BY 4.0)**. Contributions to the textbook source are expected to be compatible with that license.

Instructor-facing supplements are separate commercial works unless a file explicitly says otherwise. Examples include slide decks, Canvas course packages, test banks, answer keys, solution keys, private instructor notes, rubrics, and implementation guides. Please do not add commercial supplement files to this public repository unless the intended license is clear in that file or folder.

## Good contributions right now

The most useful contributions during public beta are:

- factual corrections, especially claims about real products, companies, regulations, or research;
- broken-link reports;
- better sources for existing claims;
- citation cleanup and BibTeX entries;
- accessibility improvements;
- clearer explanations for introductory students;
- lab improvements that avoid private data and unsafe assumptions;
- suggestions for diagrams, figures, workflows, and visual examples;
- small copyedits, typo fixes, and formatting corrections.

Large rewrites are welcome only when they preserve the book's teaching voice: plainspoken, current, evidence-backed, student-facing, and skeptical of AI hype.

## What not to add

Please avoid adding:

- private, confidential, or student-identifying information;
- copyrighted images, screenshots, tables, or long excerpts without clear permission;
- vendor marketing claims presented as neutral evidence;
- unsourced claims about adoption rates, cost savings, job losses, or productivity gains;
- instructions that encourage entering real credentials, private customer data, student records, financial data, medical data, or other sensitive information into AI tools;
- instructor-only supplements unless their license boundary is explicit.

## Source standards

This textbook prefers sources that can be checked. Strong sources include government publications, official standards, public company filings, peer-reviewed research, court or regulatory documents, product documentation, and reputable journalism.

Vendor documentation can be useful for explaining what a tool claims to do, but vendor case studies and consultancy reports should be treated carefully. They may be included when relevant, but they should not be framed as neutral proof of broad impact unless the claim is independently supported.

For fast-moving claims, include dates. Examples include model names, product features, pricing, regulations, adoption numbers, and public incidents.

## Citation and source updates

The project is moving toward a more consistent source system using `references.bib`, chapter source notes, and a source manifest. When adding or revising a claim:

1. prefer a source that is stable and authoritative;
2. remove tracking parameters such as `utm_source` from URLs;
3. add or update a BibTeX entry when appropriate;
4. distinguish evidence from vendor description;
5. avoid bare claims like "AI is transforming everything" unless the sentence explains a specific workflow, task, or measured result.

A good source update should make the book easier for another instructor, librarian, or student to verify.

## Images and figures

Educational figures are a major priority for the book. The best figure suggestions are not decorative. They should help students understand a workflow, tradeoff, system boundary, decision process, risk, or verification step.

Good candidates include:

- process diagrams;
- before/after workflow maps;
- risk matrices;
- human-in-the-loop decision diagrams;
- simple dashboards;
- annotated mockups;
- concept maps;
- lab-specific visual aids.

Every figure should eventually have a caption, alt text, source or generation metadata, and a clear teaching purpose.

## Labs and examples

Labs should be realistic but safe. They should use fictional or synthetic data unless the source is public and appropriate for student use. A strong lab asks students to use AI tools critically, verify outputs, document assumptions, and explain risks.

Avoid labs that require paid accounts unless there is a no-cost alternative. Avoid labs that require students to enter real personal, customer, employment, financial, health, or academic records into an AI system.

## How to report an issue

Use the GitHub Issues tab and choose the most relevant template. A useful issue usually includes:

- the chapter or page;
- the exact sentence, section, source, figure, or lab step involved;
- what seems wrong or unclear;
- a suggested fix or better source, if available;
- the date you noticed the issue.

Small, precise reports are extremely valuable.

## Pull request checklist

Before opening a pull request, please check that:

- the change is compatible with the open textbook license;
- new claims are sourced;
- links are clean and free of tracking parameters;
- examples are appropriate for introductory students;
- no private or sensitive information has been added;
- images have a clear educational purpose and include draft alt text/captions when possible;
- the Quarto book still renders locally if your change affects structure or formatting.

For local rendering, use:

```bash
scripts/render-local.sh
```

Portable formats can be rendered with:

```bash
scripts/render-local.sh --to typst
scripts/render-local.sh --to epub
```

## Editorial posture

This book treats AI as neither magic nor doom. Contributions should help students understand what AI tools can do, where they fail, how organizations deploy them, what evidence supports claims, and how responsible professionals should remain accountable when AI is part of the work.
