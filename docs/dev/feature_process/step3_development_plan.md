# Step 3: Development Plan

_Proceed only after “Approved Step 2.” Pause again after delivering Step 3 until the user replies with “Approved Step 3.”_

## Objective
Break the feature into atomic implementation stages, identify dependencies, and define verification expectations before coding starts.

## Deliverable
- Numbered plan (≤1 page) saved in `docs/plans/`
- Filename: `{feature_name}_step3_development_plan.md`

## Structure
For each stage include:
- Goal
- Dependencies
- Expected changes (keep conceptual; include database or function signature updates without full implementations)
- Verification approach (manual smoke tests are sufficient)
- Risks or open questions (bullet points)
- Reminder of which canonical components/API contracts will be touched so shared assets stay aligned

Additional requirements:
- Stages should be ~≤1 hour or ≤50 lines of change; flag anything larger so it can be split before implementation
- Document database changes conceptually—no SQL
- Include planned function signatures when relevant, without code

## Guardrails
- Avoid full code, HTML templates, detailed SQL, or verbose explanations
- Keep Stage count manageable; if work exceeds about eight stages or a day of effort, recommend splitting into separate features before moving on

## Next
Send the plan for review and wait for “Approved Step 3.” Only after approval should you commit Steps 1–3 (if not already) and move on to `docs/dev/feature_process/step4_implementation.md`.
