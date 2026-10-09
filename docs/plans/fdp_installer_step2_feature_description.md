> **Feature plan:** [Step 1](./fdp_installer_step1_solution_assessment.md) · [Step 2](./fdp_installer_step2_feature_description.md) · [Step 3](./fdp_installer_step3_development_plan.md) · [Step 4](./fdp_installer_step4_implementation_summary.md)

## Problem

FDP currently documents a subtree installation, while consumers who choose a submodule must manually compose installation and upstream-update commands. They need a supported command-line path that manages an FDP submodule at `docs/fdp`.

## User Stories

- As a repository maintainer, I want to add FDP to my current Git repository with one command so that the workflow instructions are available at a predictable path.
- As a repository maintainer, I want to synchronize the installed FDP submodule with its origin so that I can adopt upstream FDP updates deliberately.
- As a contributor, I want clear failure messages when the repository or submodule is unsuitable so that I can recover without damaging my working tree.

## Core Requirements

- Provide a Bash command interface with distinct install and sync operations, run against the caller’s current Git repository.
- Install FDP as the `docs/fdp` submodule from `https://github.com/gulkily/fdp.git`, tracking its published `master` branch.
- Refuse install when `docs/fdp` is already occupied by something other than the expected FDP submodule; report the needed recovery action.
- Synchronize only the existing `docs/fdp` FDP submodule from its configured `origin`, and leave the consuming repository’s pointer change visible for the maintainer to review and commit.
- Update the public installation guidance to describe the submodule workflow and its initialization requirement for downstream clones.

## Delivery Scope

- Work type: application change.

## Completion Boundary

- Normal entry: a maintainer runs the installer’s install operation from the root or a nested directory of a Git working tree.
- End-to-end outcome: the repository contains a configured `docs/fdp` submodule and can use the documented FDP instructions.
- Recovery: invalid repository context, a conflicting path, a missing submodule, or an unavailable upstream produces an actionable error without overwriting files or creating a consuming-repository commit.
- Release condition: the script’s install and sync flows are verified in disposable Git fixtures, and README instructions match the supported interface.

## Risks

- **Existing `docs/fdp` content could be mistaken for a managed submodule.** Validate the path type before any mutation; refuse conflicts with recovery guidance.
- **Upstream synchronization could create an unintended history change.** Validate behavior in a fixture with a local upstream before Step 3; keep the pointer change uncommitted in the consuming repository.
- **Submodule checkout state may not follow the intended branch.** Validate the configured branch and origin before updating; report detached or incompatible state rather than guessing.
- **The new workflow can diverge from README guidance.** Compare the published quick start with the command interface before implementation planning.

## Shared Component Inventory

- `README.md` installation and reuse guidance: extend as the canonical public installation surface; it currently presents the subtree alternative.
- `scripts/`: no existing installer or command interface; add one repository-owned Bash command here because the behavior is project maintenance, not a UI or API feature.
- No existing UI, API, or data-rendering surfaces apply.

## User Flow

1. The maintainer obtains the FDP installer and runs its install operation inside a Git repository.
2. The installer validates the repository and adds FDP at `docs/fdp`.
3. The maintainer reviews and commits the resulting `.gitmodules` and submodule pointer changes.
4. Later, the maintainer runs the sync operation, reviews the updated pointer, and commits it when ready.

## Success Criteria

- A fresh disposable Git repository can install FDP at `docs/fdp` through the documented command.
- A repository with the installed submodule can synchronize it from configured origin and exposes the resulting pointer change without committing it.
- Conflict and missing-submodule cases exit without altering unrelated files and provide a clear next action.
- README instructions accurately cover installation, clone initialization, synchronization, and review/commit responsibility.
