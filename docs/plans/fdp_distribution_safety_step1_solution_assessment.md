> **Feature plan:** [Step 1](./fdp_distribution_safety_step1_solution_assessment.md) · [Step 2](./fdp_distribution_safety_step2_feature_description.md) · [Step 3](./fdp_distribution_safety_step3_development_plan.md) · [Step 4](./fdp_distribution_safety_step4_implementation_summary.md)

## Original Query

I am worried about the fdp script. a) I'm not sure how the user would run it if they haven't already copied fdp into their repo, so what is the point of it? Should the install process be something different? b) I'm really worried about it potentially messing something up in the user's repo. I really want to bulletproof it. Please write Step 1 of fdp.

## Understood Intent

Choose a trustworthy way to distribute FDP before it is installed, while making any consuming-repository changes explicit, reviewable, and hard to make accidentally.

## Problem

The documented `curl | bash` bootstrap can run before FDP is present, but it executes mutable remote code that writes Git state in the user's repository.

## Option A — Retain the remote bootstrap script and strengthen its safeguards.

Keep `curl -fsSL .../fdp | bash -s -- install`, but make the script require an explicit confirmation or `--apply`, preflight every affected path and Git state, and offer a no-write inspection mode.

- Pros
  - Preserves a one-command installation experience.
  - The checked-in command can provide tailored diagnostics and sync behavior.
- Cons
  - Users still execute unpinned remote code before reviewing it.
  - A comprehensive preflight reduces, but cannot eliminate, the risk of bootstrap defects or Git edge cases.

## Option B — Publish Git-native install and update commands; retain FDP only as an optional local helper.

Document an explicit `git submodule add` command for installation and explicit Git commands for updates. After installation, FDP may include a helper that only inspects state or prints the equivalent command.

- Pros
  - Nothing unreviewed executes in the consuming repository; Git shows exactly what will change.
  - Works before FDP exists locally and removes the bootstrap distribution problem.
  - The resulting `.gitmodules` and submodule-pointer changes remain visible for review before commit.
- Cons
  - Commands are longer and offer less customized recovery guidance.
  - The optional helper cannot be the required installation path.

## Option C — Distribute a versioned installer through a package manager or signed release artifact.

Provide a separately installed, pinned CLI which performs the current install and sync operations after users install it outside their target repository.

- Pros
  - Gives the installer an identity separate from the repository it modifies.
  - Can support version pinning, integrity verification, and richer preflight checks.
- Cons
  - Adds publishing, platform, and supply-chain maintenance.
  - Does not by itself make Git mutations safer than Option B.

## Recommendation

Choose **Option B** for the next vertical slice: make explicit Git commands the supported install and update path, and remove `curl | bash` from the quick start. This directly answers how FDP is run before it exists locally: it is not run; Git installs it transparently. Step 2 should define the exact commands, a no-surprises safety contract (including behavior with dirty or staged host state), and whether the existing helper remains as a read-only diagnostic after installation.
