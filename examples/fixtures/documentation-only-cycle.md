# Fixture: Documentation-Only Cycle

## Setup and initial prompt

Use a clean repository. Send:

> As a maintainer, I want a troubleshooting guide for recovering from a stale local cache, so operators can restore normal access. This is documentation-only: the allowed scope is `docs/troubleshooting/` and `README.md`; do not change application, test, CI, deployment, or generated files. Please write Step 2 of docs/fdp/FEATURE_DEVELOPMENT_PROCESS.md.

Then review and explicitly approve Steps 2 and 3 before implementation.

## Expected decisions and artifacts

- Step 2 preserves the documentation-only work type, allowed paths, audience outcome, recovery/correction path, and runtime-change prohibition.
- Step 3 repeats that boundary in its Completion Contract and plans only changes within the allowed paths.
- Step 4 creates the branch and planning-doc commit before edits.
- Each stage records document integrity, evidence, local link/path, and changed-file-scope checks. Runtime, UI, deployment, migration, and release checks are marked not applicable with a reason unless a specific claim requires one.

## Pass condition

`git diff --name-only` lists only the approved documentation paths and planning artifacts; there are no source, test, CI, deployment, or generated-file changes.
