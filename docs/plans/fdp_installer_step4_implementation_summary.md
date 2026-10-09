> **Feature plan:** [Step 1](./fdp_installer_step1_solution_assessment.md) · [Step 2](./fdp_installer_step2_feature_description.md) · [Step 3](./fdp_installer_step3_development_plan.md) · [Step 4](./fdp_installer_step4_implementation_summary.md)

## Stage 1 - Safe FDP submodule installation

- Changes:
  - Added `fdp install` to add the canonical FDP repository as `docs/fdp` on `master`.
  - Validated the caller’s Git working tree and rejected an occupied or already-registered target path before mutation.
  - Reported that `.gitmodules` and the submodule pointer require maintainer review and commit.
- Verification:
  - Ran `bash -n fdp` successfully.
  - In a disposable repository, ran install from a nested directory and verified the registered path, URL, branch, and working submodule checkout.
  - Verified an occupied `docs/fdp` path and a non-Git directory fail without changing the fixture’s existing content.
  - Deployment, UI, database, and migration checks are not applicable to this local Bash command.
- Notes:
  - Upstream validation established that `https://github.com/gulkily/fdp.git` publishes `master`, not `main`; the approved Step 2–3 artifacts were corrected and committed before this stage.

## Stage 2 - Safe FDP submodule synchronization

- Changes:
  - Added `fdp sync` to validate the registered FDP submodule, canonical configuration, initialized checkout, origin remote, clean state, and `master` checkout.
  - Fetches the configured `origin` and fast-forwards only; it never commits the resulting host-repository pointer update.
  - Added recovery messages for missing, uninitialized, dirty, incompatible, detached, or already-modified submodule states.
- Verification:
  - Ran `bash -n fdp` successfully.
  - In a disposable host and local bare-upstream fixture, published a new upstream commit, synchronized it, verified the new file in `docs/fdp`, and verified the host reports its uncommitted submodule-pointer change.
  - Verified dirty and missing-submodule cases fail before synchronization.
  - Deployment, UI, database, and migration checks are not applicable to this local Bash command.
- Notes:
  - The sync fixture changed the submodule checkout’s `origin` to a local bare repository while retaining the canonical FDP entry in `.gitmodules`, confirming synchronization uses the configured origin rather than a hard-coded fetch URL.

## Stage 3 - Publish the submodule workflow

- Changes:
  - Replaced README subtree installation and update guidance with the supported submodule installer workflow.
  - Documented downstream clone initialization, synchronization from configured origin, review, and explicit maintainer commits.
  - Documented that the commands refuse unsafe submodule states and do not create host-repository commits.
- Verification:
  - Ran `bash -n fdp` successfully.
  - In a disposable repository, exercised the README’s piped installer and sync command form using the local script artifact, committed the submodule, and cloned it with `--recurse-submodules`; the cloned FDP instructions were present.
  - Ran `node scripts/check-markdown-links.mjs`: 39 Markdown files checked with valid local links.
  - Ran `git diff --check` successfully.
  - Deployment, UI, database, and migration checks are not applicable to this documentation and local Bash-command release.
- Notes:
  - The public raw-GitHub command targets `master`, matching the verified upstream default branch and becoming fetchable at that URL when this change is merged.

## Stage 4 - Rename the FDP command

- Changes:
  - Renamed the executable from `scripts/fdp-submodule.sh` to the concise `fdp` command.
  - Updated its usage text, README commands, and planning references to use `fdp`.
- Verification:
  - Ran `bash -n fdp` and checked `fdp --help` for the new command name.
  - In a disposable repository, exercised the piped `fdp` install and sync command forms and verified the installed FDP instructions.
  - Ran `node scripts/check-markdown-links.mjs`: 38 Markdown files checked with valid local links.
  - Ran `git diff --check` successfully.
- Notes:
  - This is a command-path and documentation rename only; install and synchronization behavior are unchanged.

## Stage 5 - Add the FDP root shortcut

- Changes:
  - Moved the executable to the repository root as `fdp` and preserved its executable mode.
  - Added concise comments telling an agent that `@fdp` refers to the approval-gated instructions in `FEATURE_DEVELOPMENT_PROCESS.md`.
  - Updated public raw-file URLs, the quick-start prompt, and planning references for the root-level command.
- Verification:
  - Ran `bash -n fdp`, confirmed `fdp` is executable, and checked `./fdp --help`.
  - In a disposable repository, exercised the piped root-level `fdp` install and sync command forms and verified the installed FDP instructions.
  - Ran `python scripts/check-markdown-links.py` and `perl scripts/check-markdown-links.pl`: both checked 38 Markdown files with valid local links.
  - Ran `git diff --check` successfully.
- Notes:
  - An agent can now be given the root `fdp` file as `@fdp` and instructed to read its referenced workflow document.
