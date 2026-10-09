> **Feature plan:** [Step 1](./fdp_installer_step1_solution_assessment.md) · [Step 2](./fdp_installer_step2_feature_description.md) · [Step 3](./fdp_installer_step3_development_plan.md) · [Step 4](./fdp_installer_step4_implementation_summary.md)

## Original Query

Let's write an installer script. It should have at least 2 features:
- Adding FDP to the current repo (I guess this would just be a bash command?)
- Synchronizing the current repo's FDP submodule with origin.
Please write Step 1 of FEATURE_DEVELOPMENT_PROCESS.md.

## Understood Intent

Provide a small, repeatable command-line installer for a consuming Git repository that adds FDP as a submodule and can later update that same submodule from its configured upstream.

## Problem

Consumers need a safe, repeatable way to install and update FDP without manually reconstructing Git submodule commands.

## Option A — A repository-owned Bash script manages a tracked FDP submodule.

The script runs from a consuming repository, adds FDP at a documented path when absent, and updates the existing submodule from its configured origin when asked.

- Pros
  - Directly matches the requested submodule workflow.
  - Makes installation and synchronization consistent and discoverable.
  - Can validate Git state and report clear recovery guidance.
- Cons
  - Requires Bash and Git in the consuming environment.
  - Must define the submodule path and branch policy.

## Option B — Publish two copy-paste Git commands without a script.

Document one command for `git submodule add` and one for updating the submodule.

- Pros
  - Smallest maintenance surface.
  - Uses only native Git commands.
- Cons
  - Does not provide the requested installer script.
  - Repeats validation and path decisions for every consumer.

## Option C — Continue using the existing Git subtree workflow.

Extend the current README guidance for a vendored `docs/fdp` subtree and its update command.

- Pros
  - Aligns with the repository’s current recommended installation method.
  - Avoids submodule initialization requirements for contributors.
- Cons
  - Conflicts with the requested FDP submodule synchronization behavior.
  - Changes the intended distribution model rather than implementing it.

## Recommendation

Choose **Option A**: deliver a small Bash interface with explicit install and sync operations, treating the FDP directory as a Git submodule. It is a viable vertical slice: a repository owner can install FDP through the normal command and later bring that exact submodule forward from origin, with validation for missing or incompatible repository state. Step 2 should settle the target path, upstream URL/branch defaults, and whether synchronization creates a commit in the consuming repository.
