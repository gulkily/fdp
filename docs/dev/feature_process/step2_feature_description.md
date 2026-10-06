# Step 2: Feature Description

_Open this only after receiving “Approved Step 1” (or if Step 1 was skipped). Pause again after delivering Step 2 until the user sends “Approved Step 2.”_

## Objective
Capture the problem framing, desired outcomes, and shared-component considerations before planning implementation work.

## Deliverable
- Concise doc (≤1 page) stored in `docs/plans/`
- Filename: `{feature_name}_step2_feature_description.md`

## Structure
- Standard Plan navigation bar (template in `FEATURE_DEVELOPMENT_PROCESS.md`; omit skipped Step 1)
- Problem: 1–2 sentences
- User stories: bullet list in the format “As [role], I want [goal] so that [benefit]”
- Core requirements: 3–5 bullets capturing non-negotiable behaviors
- Delivery scope:
  - Work type: application change or documentation-only
  - For documentation-only work: allowed documentation files or directories, intended audience/outcome, and an explicit statement that application/runtime changes are not permitted
- Completion boundary: for application work, normal entry, end-to-end outcome, needed recovery, and release condition; for documentation-only work, document completion, intended audience outcome, correction/recovery path, and handoff condition
- Risks (2–4): impact, earliest validation, mitigation before Step 3
- Shared component inventory: enumerate every existing UI/API surface that already renders the data; specify whether the feature reuses/extends the canonical component or needs a new one (with rationale)
- Simple user flow: numbered steps
- Success criteria: measurable outcomes that confirm the feature solves the problem

## Guardrails
- Avoid implementation details, code, database schema, UI mockups, or verbose descriptions
- Surface material risks; do not bury them in other sections
- A feature is a normal-flow vertical slice, not a component, API, cache, migration, or hidden route; otherwise call it internal maintenance
- Documentation-only scope is valid when the deliverable itself is the outcome. It must name the allowed file scope; do not use it to make application, CI, deployment, or generated-artifact changes without returning to Step 2 for approval.
- Keep the doc lightweight enough to consume at a glance

## Next
Deliver the document, request confirmation, and wait for "Approved Step 2." Once approved, continue with `docs/dev/feature_process/step3_development_plan_before.md`.
