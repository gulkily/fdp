# Step 4: Implementation

_Open only after the user responds “Approved Step 3.”_

## Objective
Execute the plan in atomic stages on a dedicated feature branch, documenting progress and verification as you go.

## Checklist
- Create the feature branch (e.g., `feature/request-feed-enhancements`) **before** any implementation work
- Commit the approved planning documents from Steps 1–3 to that branch before touching the codebase
- Work stages sequentially, keeping each stage <2 hours
- After completing a stage, perform manual smoke verification using existing UI/CLI flows—do not add automated tests or ad-hoc fixtures
- Update the Step 4 implementation summary immediately after each stage (document what shipped and how it was verified)
- Commit code plus the Step 4 summary update before beginning the next stage
- Favor the simplest viable implementation first; iterate only when necessary
- Before adding new presentation markup or API payloads, confirm whether a canonical component/contract already exists per the Step 2 inventory and reuse/extend instead of duplicating
- Conclude by finalizing the implementation summary document

## Implementation Summary Artifact
- Location: `docs/plans/`
- Filename: `{feature_name}_step4_implementation_summary.md`
- Contents per stage:
  - Stage number/name
  - Changes shipped
  - Verification performed (manual steps)
  - Notes/risks

_Template_
```markdown
## Stage X – {title}
- Changes:
- Verification:
- Notes:
```

## Completion Criteria
- All stages implemented and manually verified
- Feature accessible through normal UI (not just direct URLs)
- Required roles, migrations, or other dependencies resolved
- Documentation updated

## Next
Once the summary is complete and all work is committed, notify the user for review or handoff as needed. If additional scope emerges, return to the appropriate earlier step instead of improvising within Step 4.
