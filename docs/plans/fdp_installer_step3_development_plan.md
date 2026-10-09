> **Feature plan:** [Step 1](./fdp_installer_step1_solution_assessment.md) · [Step 2](./fdp_installer_step2_feature_description.md) · [Step 3](./fdp_installer_step3_development_plan.md) · [Step 4](./fdp_installer_step4_implementation_summary.md)

## Completion Contract

- Normal entry: a maintainer invokes the documented installer from any directory inside a Git working tree.
- End-to-end outcome: `install` registers FDP as the `docs/fdp` submodule on `main`; `sync` advances that configured submodule from its `origin` without committing the host repository.
- Required recovery: non-Git context, a conflicting path, a missing or incompatible submodule, a dirty submodule, and upstream failure exit with a next action and preserve unrelated host files.
- Deployment/external verification: validate both commands in disposable Git repositories, including a local upstream fixture that models fetch and pointer advancement; no deployment is applicable.
- Release condition: command behavior and README guidance are verified, and maintainer review/commit responsibility is explicit.

## Key Risks

- **High risk: path conflict can overwrite a consumer’s files.** Validate `docs/fdp` before mutation; refuse anything other than the expected managed submodule.
- **High risk: an update can advance an unreviewed pointer or discard local submodule work.** Validate origin, branch, and clean state before synchronization; leave the host change uncommitted.
- **High risk: a command run outside a repository can affect the wrong directory.** Resolve and validate the Git top-level directory before either operation.
- **High risk: published guidance can preserve the conflicting subtree workflow.** Validate README commands against the verified script interface before release.

## Stage 1

- Goal: deliver a safe install command for the FDP submodule.
- Dependencies: approved Step 2 contract; Git and Bash available to the caller.
- Expected changes: add the repository-owned Bash command at `scripts/fdp-submodule.sh`; expose `scripts/fdp-submodule.sh install`; locate the current repository, preflight `docs/fdp`, and register `https://github.com/gulkily/fdp.git` on `main` without overwriting conflicts.
- Verification approach: exercise install from a nested directory in a disposable Git repository; verify `.gitmodules`, the `docs/fdp` submodule registration, and conflict/non-Git failures leave unrelated fixture files unchanged.
- Risks or open questions:
  - Impact: a bad path check could create or replace consumer content.
  - Early warning / validation: fixture with ordinary content at `docs/fdp`.
  - Mitigation: fail before any Git mutation and print the recovery action.
- Canonical components/API contracts touched: new CLI contract `scripts/fdp-submodule.sh install`; canonical public installation path `docs/fdp`.

## Stage 2

- Goal: deliver a safe sync command for the installed FDP submodule.
- Dependencies: Stage 1; a valid `docs/fdp` submodule with configured `origin`.
- Expected changes: extend the command with `scripts/fdp-submodule.sh sync`; preflight submodule identity, origin, checkout branch, and clean state; fetch and fast-forward the configured FDP submodule while leaving its host pointer change uncommitted.
- Verification approach: use a disposable host plus local bare upstream fixture with a later commit; verify the submodule advances, the host shows only the pointer change, and missing/dirty/incompatible submodule cases make no pointer change.
- Risks or open questions:
  - Impact: local work or an unintended revision could be lost.
  - Early warning / validation: dirty and detached/incompatible fixture states.
  - Mitigation: reject unsupported states before fetching or advancing the checkout.
- Canonical components/API contracts touched: CLI contract `scripts/fdp-submodule.sh sync`; Git submodule `origin` and configured-branch contract.

## Stage 3

- Goal: publish and verify the supported submodule workflow.
- Dependencies: Stages 1–2 command behavior verified.
- Expected changes: revise `README.md` quick start and reuse guidance to use the installer, explain clone submodule initialization, sync, review, and host-repository commit responsibility; remove or clearly demote conflicting subtree guidance.
- Verification approach: follow README commands in a disposable fixture; run the repository Markdown-link check and whitespace check; review the documented recovery path against command output.
- Risks or open questions:
  - Impact: consumers follow obsolete subtree instructions.
  - Early warning / validation: search README for contradictory install/update commands.
  - Mitigation: make the submodule workflow the single recommended path.
- Canonical components/API contracts touched: `README.md` canonical installation documentation; `scripts/fdp-submodule.sh` CLI contract.
