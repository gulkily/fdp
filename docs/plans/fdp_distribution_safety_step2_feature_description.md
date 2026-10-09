> **Feature plan:** [Step 1](./fdp_distribution_safety_step1_solution_assessment.md) · [Step 2](./fdp_distribution_safety_step2_feature_description.md) · [Step 3](./fdp_distribution_safety_step3_development_plan.md) · [Step 4](./fdp_distribution_safety_step4_implementation_summary.md)

## Problem

FDP's documented bootstrap executes a remote script that mutates the caller's repository. Users need an installation and update workflow whose commands, prerequisites, and resulting Git changes are visible before they act.

## User Stories

- As a repository maintainer, I want to install FDP with explicit Git commands so that no downloaded program writes to my repository.
- As a repository maintainer, I want to update FDP with an explicit, fast-forward-only Git workflow so that I can inspect and commit the new submodule pointer deliberately.
- As a cautious contributor, I want a clear stop-and-recovery path for an unsuitable repository state so that an install or update cannot overwrite my work.

## Core Requirements

- Make Git-native commands the only supported FDP install and update interface; remove `curl | bash` guidance and retire the mutating `fdp` script.
- Install FDP only as `docs/fdp` from the documented upstream and branch, after the maintainer confirms the repository is non-bare, clean, and has no existing `docs/fdp` path.
- Require maintainers to inspect the resulting `.gitmodules` and submodule-pointer changes, then make their own host-repository commit; no supported command commits, resets, stashes, removes, or overwrites host files.
- Update only an initialized, clean, expected FDP submodule through fetch plus fast-forward; refuse or document recovery for dirty, detached, incompatible, or non-fast-forward state.
- Document clone initialization and recovery commands alongside the normal workflow.

## Delivery Scope

- Work type: application change.

## Completion Boundary

- Normal entry: a maintainer starts at the root of a clean, non-bare Git working tree and follows the README's explicit Git commands.
- End-to-end outcome: the repository has the `docs/fdp` submodule; later, its checked-out FDP revision can advance without any host-repository commit being created automatically.
- Recovery: a non-Git/bare/dirty repository, an occupied target path, an uninitialized submodule, or an unexpected checkout directs the maintainer to stop and resolve that condition before retrying; it must not recommend a destructive command.
- Release condition: the documented install, clone initialization, update, and refusal/recovery paths have been exercised in disposable Git fixtures, and no executable FDP bootstrap remains advertised or tracked.

## Risks

- **Native commands can still change `.gitmodules` and the index.** Earliest validation: run the install sequence in a clean disposable repository and inspect status after each command. Mitigation: require a clean start, state the exact affected files, and require review before commit.
- **A user can copy the commands in an unsuitable state.** Earliest validation: fixtures for dirty host state, target-path conflicts, and an uninitialized or dirty submodule. Mitigation: publish stop conditions and nondestructive recovery guidance before each mutating command.
- **Removing the helper can leave stale references or break expectations.** Earliest validation: search tracked documentation and repository references for `fdp install`, `fdp sync`, and bootstrap URLs. Mitigation: retire the script and make README the single canonical interface.

## Shared Component Inventory

- `README.md` is the canonical install, clone, update, and recovery surface; revise it rather than adding another guide.
- Root `fdp` is the existing mutating CLI surface; retire it to prevent a second, less transparent supported workflow.
- No UI, API, data-rendering, or application runtime components apply.

## User Flow

1. The maintainer verifies the repository state using the documented read-only Git checks.
2. From the repository root, the maintainer runs the documented Git submodule-add command and inspects `.gitmodules`, `docs/fdp`, and Git status.
3. The maintainer commits those reviewed changes using their normal repository practice.
4. Later, the maintainer checks the submodule and host state, fetches and fast-forwards FDP using the documented Git commands, inspects the pointer change, and commits it only when ready.

## Success Criteria

- README contains no `curl | bash`, `fdp install`, or `fdp sync` supported workflow.
- A clean disposable repository installs the expected `docs/fdp` submodule solely through the documented Git commands and leaves all changes uncommitted for review.
- A fixture can initialize a clone and fast-forward an expected, clean FDP submodule; the host shows only the reviewed pointer update.
- Documented unsuitable-state cases stop before a destructive action and provide a nondestructive next step.
