> **Feature plan:** [Step 1](./fdp_distribution_safety_step1_solution_assessment.md) · [Step 2](./fdp_distribution_safety_step2_feature_description.md) · [Step 3](./fdp_distribution_safety_step3_development_plan.md) · [Step 4](./fdp_distribution_safety_step4_implementation_summary.md)

## Completion Contract

- Normal entry: a maintainer begins in the root of a clean, non-bare Git working tree and follows the README's visible Git checks and commands.
- End-to-end outcome: install adds the canonical `docs/fdp` submodule; update fast-forwards only the expected, clean submodule and leaves the host pointer uncommitted for review.
- Required recovery: unsuitable host state, an occupied path, unexpected submodule configuration, a detached/dirty checkout, or a non-fast-forward update stops with a documented nondestructive next step.
- Deployment/external verification: run the published command sequences against disposable local Git fixtures modelling install, clone initialization, fast-forward update, and refusal states; no deployment applies.
- Release condition: the root mutating CLI is removed, README is the sole supported interface, fixture results and documentation checks pass, and the published repository contains no bootstrap command.

## Key Risks

- **High risk:** Native Git commands can modify `.gitmodules`, the index, and `docs/fdp`. Early validation: inspect status after each fixture command. Mitigation: require a clean host and absent target before the documented add command.
- **High risk:** A submodule update can advance an unreviewed or incompatible checkout. Early validation: fixture dirty, detached, wrong-origin, and non-fast-forward states. Mitigation: document identity/clean/branch checks and use only fast-forward merge.
- Stale instructions could preserve the unsafe bootstrap. Early validation: repository-wide reference search. Mitigation: remove the script and every supported invocation in the same change set.

## Stage 1

- Goal: remove the alternative mutating bootstrap interface.
- Dependencies: approved Step 2 safety contract.
- Expected changes: delete root `fdp`; remove all tracked references that advertise `fdp install`, `fdp sync`, or `curl | bash` as a supported command.
- Verification approach: search tracked files for retired commands and confirm no executable bootstrap remains.
- Risks or open questions:
  - Impact: a stale reference directs a user to a missing or unsafe interface.
  - Early warning / validation: reference search before documentation release.
  - Mitigation: treat README as the only canonical interface before moving to Stage 2.
- Canonical components/API contracts touched: retirement of root `fdp` CLI contract.

## Stage 2

- Goal: publish the explicit, review-first Git workflow.
- Dependencies: Stage 1; confirmed canonical upstream URL, `master` branch, and `docs/fdp` path.
- Expected changes: rewrite README quick start and reuse guidance with read-only preflight checks; explicit install, clone initialization, and fast-forward-only update commands; exact affected Git state; review/commit responsibility; and nondestructive recovery guidance.
- Verification approach: execute README commands verbatim in a clean disposable fixture, then compare its `.gitmodules`, submodule registration, and host status with the documented outcome.
- Risks or open questions:
  - Impact: commands may be copied from an unsafe directory or repository state.
  - Early warning / validation: fixtures run from a nested directory, dirty host, and occupied target.
  - Mitigation: require repository root, clean status, and absent target before the first mutating command; tell users to stop instead of cleaning state for them.
- Canonical components/API contracts touched: `README.md` canonical installation, update, clone, and recovery contract.

## Stage 3

- Goal: make the published safety claims reproducible.
- Dependencies: Stage 2 workflow text.
- Expected changes: add a small disposable-Git-fixture check for the documented install, clone initialization, fast-forward update, and key refusal states; keep fixture upstream local and temporary.
- Verification approach: run the check from a clean working tree; assert the expected changes are limited to `.gitmodules` and the submodule pointer, and that refusal fixtures leave their host state unchanged.
- Risks or open questions:
  - Impact: a network-dependent or destructive fixture could undermine validation.
  - Early warning / validation: run offline with a temporary local upstream and inspect temporary paths.
  - Mitigation: create unique temporary directories, avoid host-repository mutations, and clean only the verified temporary fixture directory.
- Canonical components/API contracts touched: README command contract and disposable Git-fixture verification contract.
