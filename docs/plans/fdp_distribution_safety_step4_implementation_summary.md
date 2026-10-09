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

## Stage 2 - Publish the review-first Git workflow
- Changes:
  - Replaced the remote-script quick start with visible Git preflight and submodule-add commands.
  - Documented explicit clone initialization, expected-submodule checks, fast-forward-only update, review, and nondestructive recovery paths.
  - Made README the sole supported installation and update interface.
- Verification:
  - `python scripts/check-markdown-links.py` passed: 42 Markdown files checked.
  - A disposable Git fixture ran the documented clean-host checks and `git submodule add --branch master https://github.com/gulkily/fdp.git docs/fdp`; it verified the configured URL/branch, initialized checkout, and staged changes limited to `.gitmodules` and `docs/fdp`.
  - `git diff --check` passed; the active repository contains no `curl | bash`, `fdp install`, or `fdp sync` reference.
  - Runtime, UI, deployment, migration, and release checks are not applicable; this stage changes the repository's published Git workflow.
- Notes:
  - Fixture verification used a uniquely named temporary directory and did not modify this repository.
