# Step 4: Implementation (Do)

_Open only after completing Step 4 Before._

## Objective
Execute the plan in atomic stages on a dedicated feature branch, documenting progress and verification as you go.

## Execution Rules
- Work stages sequentially, keeping each stage <2 hours
- Favor the simplest viable implementation first; iterate only when necessary
- Before adding new presentation markup or API payloads, confirm whether a canonical component/contract already exists per the Step 2 inventory and reuse/extend instead of duplicating
- Complete the Step 3 Contract—not just a subsystem, direct route, or preparatory asset. For documentation-only scope, complete the approved document outcome without leaving the allowed file scope.
- Require one stage-scoped commit per completed stage; do not batch multiple stages into one commit
- Commit the stage artifact plus the Step 4 summary update for that stage in the same commit before beginning the next stage

## Stage Boundary Protocol (Required)
At every stage boundary (including Stage 1), complete this sequence before starting the next stage:
1. Finish the approved artifact scope for the current stage only.
2. Run applicable verification for that stage and capture commands/results in the Step 4 summary. For documentation-only scope, run `git diff --check`, confirm changed files are within the approved documentation scope, validate local plan-navigation links and referenced local paths, and confirm findings/recommendations are evidence-backed. Record runtime, UI, deployment, migration, and release checks as not applicable unless the approved document makes a claim requiring one.
3. Update the current stage section in `{feature_name}_step4_implementation_summary.md`.
4. Run `git status --short` and confirm only intended files are included.
5. Commit with a stage-scoped message (example: `feat(stage 3): add rerun-safe historical write path`).
6. Run `git log --oneline --max-count 5` and confirm the new stage commit is present.
7. Only then begin the next stage.

## Implementation Summary Artifact
- Location: `docs/plans/`
- Filename: `{feature_name}_step4_implementation_summary.md`
- Begin with the standard Plan navigation bar (template in `FEATURE_DEVELOPMENT_PROCESS.md`; omit skipped Step 1)
- Preferred format per stage:
  - One `## Stage N - {title}` header per completed stage
  - Flat bullets for `Changes`, `Verification`, and `Notes`
  - Nested bullets under those fields when listing multiple concrete items
- Contents per stage:
  - Stage number/name
  - Changes shipped
  - Verification performed (including checks recorded as not applicable and why)
  - Notes/risks

_Template_
```markdown
## Stage X - {title}
- Changes:
- Verification:
- Notes:
```

Prefer this header-plus-bullets structure over prose paragraphs so the implementation summary stays easy to diff against the Step 3 plan and easy to review at stage boundaries.

## Next
After all planned stages are implemented and committed, continue with `docs/dev/feature_process/step4_implementation_after.md`.
