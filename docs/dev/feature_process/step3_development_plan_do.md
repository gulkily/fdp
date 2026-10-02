# Step 3: Development Plan (Do)

_Open only after completing Step 3 Before._

## Objective
Break the feature into atomic implementation stages, identify dependencies, and define verification expectations before coding starts.

## Deliverable
- Numbered plan (<=1 page) saved in `docs/plans/`
- Filename: `{feature_name}_step3_development_plan.md`

## Structure
Begin with the required compact Plan navigation bar linking Steps 1–4; omit Step 1 only when it was skipped, and use the relative-link template in `FEATURE_DEVELOPMENT_PROCESS.md`.

Add a compact `## Completion Contract` section before the stages. State the normal user entry point, the observable end-to-end outcome, failure/recovery behavior that must work, any deployment or external-system boundary that must be verified, and the release condition. Plan stages so the completed cycle satisfies this contract; do not end with a subsystem that requires a later cycle to become usable.

Start with a compact `## Key Risks` section. For every material risk, include its impact, early warning or validation point, and mitigation. Prefix risks that could make the feature unusable, threaten data, or require rollback with `**High risk:**`.

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
- Treat risks as planning gates, not a formality: a stage with a material unresolved risk must include the validation that resolves it before dependent work begins
- Canonical components/API contracts as an explicit bullet, not buried in prose
- Include the wiring, operational, and verification work required to meet the Completion Contract. Do not split a larger story into horizontal layers (for example, backend in one cycle and user access in another); split it into independently usable vertical slices instead.

Additional requirements:
- Stages should be about <=1 hour or <=50 lines of change; split anything larger before implementation
- Document database changes conceptually (no SQL)
- Include planned function signatures when relevant, without code
- Prefer bullets over prose paragraphs throughout so reviewers can scan the plan quickly

## Guardrails
- Avoid full code, HTML templates, detailed SQL, or verbose explanations
- Make risks easy to review. Keep `## Key Risks` near the top and repeat stage-specific risks where the work that addresses them occurs.
- If a proposed cycle cannot meet its Completion Contract, return to Step 2 and rescope it before implementation. A component-only change may proceed only when explicitly labeled internal maintenance work, not as a feature.
- Keep stage count manageable; if work exceeds about eight stages or a day of effort, split into separate features before moving on

## Next
After drafting the Step 3 plan document, continue with `docs/dev/feature_process/step3_development_plan_after.md`.
