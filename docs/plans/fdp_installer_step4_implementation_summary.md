> **Feature plan:** [Step 1](./fdp_installer_step1_solution_assessment.md) · [Step 2](./fdp_installer_step2_feature_description.md) · [Step 3](./fdp_installer_step3_development_plan.md) · [Step 4](./fdp_installer_step4_implementation_summary.md)

## Stage 1 - Safe FDP submodule installation

- Changes:
  - Added `scripts/fdp-submodule.sh install` to add the canonical FDP repository as `docs/fdp` on `master`.
  - Validated the caller’s Git working tree and rejected an occupied or already-registered target path before mutation.
  - Reported that `.gitmodules` and the submodule pointer require maintainer review and commit.
- Verification:
  - Ran `bash -n scripts/fdp-submodule.sh` successfully.
  - In a disposable repository, ran install from a nested directory and verified the registered path, URL, branch, and working submodule checkout.
  - Verified an occupied `docs/fdp` path and a non-Git directory fail without changing the fixture’s existing content.
  - Deployment, UI, database, and migration checks are not applicable to this local Bash command.
- Notes:
  - Upstream validation established that `https://github.com/gulkily/fdp.git` publishes `master`, not `main`; the approved Step 2–3 artifacts were corrected and committed before this stage.
