# Step 3: Development Plan (Do)

_Open only after completing Step 3 Before._

## Objective
Break the feature into atomic implementation stages, identify dependencies, and define verification expectations before coding starts.

## Deliverable
- Numbered plan (<=1 page) saved in `docs/plans/`
- Filename: `{feature_name}_step3_development_plan.md`

## Structure
Begin with the standard Plan navigation bar (template in `FEATURE_DEVELOPMENT_PROCESS.md`; omit skipped Step 1).

Then add `## Completion Contract`: normal entry, end-to-end outcome, required recovery, deployment/external verification, release condition.

Then add `## Key Risks`: impact, early validation, mitigation. Prefix usability, data, or rollback risks `**High risk:**`.

Render the plan using this preferred format for every stage:

```md
## Stage 1
- Goal: ...
- Dependencies: ...
- Expected changes: ...
- Verification approach: ...
- Risks or open questions:
  - Impact: ...
  - Early warning / validation: ...
  - Mitigation: ...
- Canonical components/API contracts touched: ...
```

For each stage include:
- A `## Stage N` header, one stage per section
- Flat bullet items for Goal, Dependencies, Expected changes, Verification approach, Risks or open questions, and Canonical components/API contracts touched
- Conceptual expected changes only; include database/function signature updates without implementations
- Bullet points under Risks or open questions whenever there is more than one item
- Resolve each material risk before dependent work begins
- Canonical components/API contracts as an explicit bullet, not buried in prose
- Include all wiring, operations, and verification needed for the Completion Contract; split stories into vertical slices, not layers

Additional requirements:
- Stages should be about <=1 hour or <=50 lines of change; split anything larger before implementation
- Document database changes conceptually (no SQL)
- Include planned function signatures when relevant, without code
- Prefer bullets over prose paragraphs throughout so reviewers can scan the plan quickly

## Guardrails
- Avoid full code, HTML templates, detailed SQL, or verbose explanations
- Keep `## Key Risks` near the top and repeat stage-specific risks
- If the Completion Contract cannot be met, rescope in Step 2; component-only work is internal maintenance
- Keep stage count manageable; if work exceeds about eight stages or a day of effort, split into separate features before moving on

## Next
After drafting the Step 3 plan document, continue with `docs/dev/feature_process/step3_development_plan_after.md`.
