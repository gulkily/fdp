# Step 2: Feature Description

_Open this only after receiving “Approved Step 1” (or if Step 1 was skipped). Pause again after delivering Step 2 until the user sends “Approved Step 2.”_

## Objective
Capture the problem framing, desired outcomes, and shared-component considerations before planning implementation work.

## Deliverable
- Concise doc (≤1 page) stored in `docs/plans/`
- Filename: `{feature_name}_step2_feature_description.md`

## Structure
- Plan navigation: begin with the required compact Plan navigation bar linking Steps 1–4; omit Step 1 only when it was skipped, and use the relative-link template in `FEATURE_DEVELOPMENT_PROCESS.md`
- Problem: 1–2 sentences
- User stories: bullet list in the format “As [role], I want [goal] so that [benefit]”
- Core requirements: 3–5 bullets capturing non-negotiable behaviors
- Complete feature boundary: identify the normal user entry point, the observable end-to-end outcome, important failure/recovery behavior, and the release condition that makes this cycle independently usable
- Risks and mitigations: 2–4 bullets; state the user or delivery impact, the earliest way to detect the risk, and the mitigation or validation needed before Step 3
- Shared component inventory: enumerate every existing UI/API surface that already renders the data; specify whether the feature reuses/extends the canonical component or needs a new one (with rationale)
- Simple user flow: numbered steps
- Success criteria: measurable outcomes that confirm the feature solves the problem

## Guardrails
- Avoid implementation details, code, database schema, UI mockups, or verbose descriptions
- Make material risks conspicuous. Do not hide a risk inside a requirement, user story, or component note; call out any risk that could make the feature unusable, require a rollout/rollback, or invalidate the proposed scope.
- Do not frame a component, API, cache, data migration, or hidden route as a completed feature. If this work is one cycle in a larger story, scope it as an independently releasable vertical slice that users can reach through the normal UI/CLI flow; otherwise label it internal maintenance work rather than a feature.
- Keep the doc lightweight enough to consume at a glance

## Next
Deliver the document, request confirmation, and wait for "Approved Step 2." Once approved, continue with `docs/dev/feature_process/step3_development_plan_before.md`.
