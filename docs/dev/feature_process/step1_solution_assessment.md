# Step 1: Solution Assessment (Optional)

_Read this file only if the feature is complex enough to require Step 1. Pause again after finishing until the user replies with “Approved Step 1.”_

## Objective
Resolve uncertainty when there are multiple viable approaches, complex trade-offs, or an unclear direction before investing in further planning.

## Deliverable
- Ultra-concise comparison document (≤1 page) located in `docs/plans/`
- Filename: `{feature_name}_step1_solution_assessment.md`

## Structure
- Plan navigation: begin with the required compact Plan navigation bar linking Steps 1–4; use the relative-link template in `FEATURE_DEVELOPMENT_PROCESS.md`
- Original query: place the user's original request first, under an `## Original Query` heading. Preserve its wording, order, detail, and intent almost verbatim; correct only grammar, spelling, capitalization, and obvious punctuation/formatting errors. Do not summarize, rewrite for clarity, or omit parts of a multi-part request.
- Problem statement (1 sentence)
- ≥2 solution options tagged sequentially (Option A/B/C/etc.) with pros/cons listed as bullets
- Clear recommendation with brief justification, including whether it can deliver an independently usable end-to-end feature slice

## Guardrails
- Keep content at a high level; no implementation details, code, or verbose prose
- Favor bullets over paragraphs for fast comparisons
- Treat `## Original Query` as an audit record of how FDP was used, not as a polished restatement of the request

## Next
Share the document for review and stop. Do not create Step 2 until the user explicitly responds with “Approved Step 1.” When approval arrives, continue with `docs/dev/feature_process/step2_feature_description.md`.
