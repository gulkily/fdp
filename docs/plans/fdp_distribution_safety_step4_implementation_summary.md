> **Feature plan:** [Step 1](./fdp_distribution_safety_step1_solution_assessment.md) · [Step 2](./fdp_distribution_safety_step2_feature_description.md) · [Step 3](./fdp_distribution_safety_step3_development_plan.md) · [Step 4](./fdp_distribution_safety_step4_implementation_summary.md)

## Stage 1 - Retire the mutating bootstrap
- Changes:
  - Removed the root `fdp` executable, which offered `install` and `sync` operations for consuming repositories.
- Verification:
  - `test ! -e fdp` confirmed no root executable remains in the working tree.
  - `git diff --check` passed.
  - `git diff --name-status -- fdp` reported only the intended deletion.
  - Runtime, UI, deployment, migration, and release checks are not applicable to this removal-only stage; the repository-wide user workflow is verified after Stage 2.
- Notes:
  - Historical planning artifacts retain references to the retired interface as an audit record; the active README workflow is replaced in Stage 2.
