# Feature Development Process

## Overview
Feature work flows through four tightly scoped steps with an optional solution assessment upfront. To keep the instructions inside the context window, the detailed guidance for each step now lives in separate files that you open only when you are ready for that step.

## Repository Boundary
Instruction files under `docs/dev/feature_process/` belong to the FDP repository. If FDP is included in another repository as a submodule or vendored directory, resolve those paths relative to the FDP repository root, not the host repository root. Planning artifacts still belong in the host repository under `docs/plans/`.

## How to Use This Chain
1. Start with the highest-numbered approved step (usually Step 1 unless explicitly skipped).
2. Read only the relevant instruction file in FDP's `docs/dev/feature_process/` directory and reprint it before starting work.
3. For Steps 3 and 4, use phase files in order: `*_before.md` -> `*_do.md` -> `*_after.md`.
4. Request approval in the format `Approved Step N` when required, and do not open the next step's files until approval is received.

## Step Guide
- **Step 1 – Solution Assessment (Optional)**: resolve uncertainty across multiple approaches. `docs/dev/feature_process/step1_solution_assessment.md`
- **Step 2 – Feature Description**: capture problem framing, user stories, requirements, and success criteria. `docs/dev/feature_process/step2_feature_description.md`
- **Step 3 – Development Plan**: break work into atomic stages with dependencies and verification notes. Start with `docs/dev/feature_process/step3_development_plan_before.md`, then follow the `do` and `after` files.
- **Step 4 – Implementation**: execute the approved artifact on a feature branch and maintain the implementation summary. The artifact may be application changes or explicitly scoped documentation-only work. Start with `docs/dev/feature_process/step4_implementation_before.md`, then follow the `do` and `after` files.

Each phase file ends with instructions for when to proceed so you never overrun the context window.

## Planning Artifacts
Each step MUST be a separate file in `docs/plans/`:
- **Step 1**: `{feature_name}_step1_solution_assessment.md`
- **Step 2**: `{feature_name}_step2_feature_description.md`
- **Step 3**: `{feature_name}_step3_development_plan.md`
- **Step 4**: `{feature_name}_step4_implementation_summary.md`

**Directory structure**: When a feature accumulates four or more planning artifacts (e.g., all Step 1–4 docs plus auxiliary notes), move them into `docs/plans/{feature_name}/`. Keep smaller efforts at the root until they grow, and update `docs/plans/README.md` when a new folder appears so others can navigate.

**Plan navigation**: Start every artifact with this relative-link bar; omit Step 1 only when skipped.

```md
> **Feature plan:** [Step 1](./{feature_name}_step1_solution_assessment.md) · [Step 2](./{feature_name}_step2_feature_description.md) · [Step 3](./{feature_name}_step3_development_plan.md) · [Step 4](./{feature_name}_step4_implementation_summary.md)
```

**Commit discipline**:
- Keep Step 1-3 planning documents uncommitted while they are being drafted/revised.
- Do not commit Step 1-3 planning documents when Step 1 or Step 2 is approved.
- After the user explicitly responds `Approved Step 3`, create the Step 4 feature branch.
- The first commit on that feature branch must contain only the approved Step 1-3 planning documents.
- During Step 4, each completed stage must be committed with its Step 4 summary update in the same commit before starting the next stage.

**Plan review**: Do not begin Step 4 until the user explicitly responds `Approved Step 3`. The first commit after branching for Step 4 must capture the approved Step 1-3 planning files.

**Step 4 commit cadence (mandatory)**:
- Make one planning commit at the start of Step 4 containing only approved Step 1–3 docs.
- Then make at least one stage-scoped artifact commit per Step 3 stage.
- Do not start Stage `N+1` until Stage `N` has:
  - applicable verification completed,
  - Step 4 summary updated for that stage,
  - a commit recorded on the branch.
- Do not squash/rebase/amend stage commits during active Step 4 execution.
- Expected minimum commit count by end of Step 4: `1 + (# of Step 3 stages)`.

**Documentation-only scope**:
- Documentation-only work is permitted only when Step 2 names it as the work type and names the allowed documentation file scope; Step 3 must retain that boundary in its Completion Contract.
- Branching and commit cadence always apply. Documentation-only verification is proportional to the approved artifact: document integrity, evidence, links, and authorized-file-scope checks are required; runtime, UI, deployment, migration, and release checks are not applicable unless the approved documents make a claim that requires one.
- Do not alter application source, tests, CI, deployment configuration, generated artifacts, or other files outside the approved documentation scope. Return to Step 2/3 for approval if such a change becomes necessary.

## Key Rules

**AI coding assistant**
- Recommend Step 1 for complex features or whenever multiple solutions exist
- Stay in the current step; do not draft/edit later deliverables without approval
- After delivering each step, explicitly request “Approved Step N” and pause until the user responds with that exact phrase
- Create separate files for each step only after receiving the relevant approval
- ALWAYS create a feature branch before Step 4 implementation
- Enforce Step 4 commit cadence: first Step 4 commit contains approved Step 1-3 planning docs; each completed stage has a stage-scoped commit that includes the Step 4 summary update
- Treat documentation-only work as a Step 4 implementation only when its allowed documentation file scope was approved in Steps 2 and 3; use applicable verification and record non-applicable runtime checks in the summary
- Prefer shared components/API contracts first; reuse or extend instead of forking markup, CSS, or payloads
- Flag scope creep early and bounce back to planning steps rather than improvising mid-implementation
- A feature is a releasable vertical slice: normal entry, end-to-end outcome, and required recovery. Component-only work is internal maintenance; split larger stories vertically.
- Keep work within a day or eight Step 3 stages; otherwise rescope the slice.
- Avoid database schema changes when possible—lean on existing models/fields
- Reprint the current step/phase instructions (from the linked FDP file) before you begin that work
- Add the Plan navigation bar to every Step 1–4 artifact
- Step 1 starts with `## Original Query`: preserve the request except mechanical grammar, spelling, capitalization, punctuation, and formatting fixes; when needed, follow it with a brief, clearly labeled `## Understood Intent` that clarifies inferred goal/context without inventing scope
- For Step 3, prefer `## Stage N` headers with flat bullet lists for each stage field so plans stay easy to scan and review
- Step 2 risks state impact, early validation, and mitigation; Step 3 begins with `## Key Risks`, and unresolved risks block dependents
- For Step 4 summaries, prefer `## Stage N - title` headers with bullet lists for changes, verification, and notes so stage handoff stays easy to audit

**User**
- Review and approve explicitly at each step
- Flag issues early so adjustments happen before implementation
- Resist adding scope during Step 4
- Prefer solutions that avoid database migrations; rely on existing schema where feasible

## Warning Signs
- **Step 1**: >1 page, >4 options, or verbose explanations
- **Step 2**: >1 page, code/DB details, mockups, buried risks, or a component-only "feature"
- **Step 3**: >1 page, stages >2 hours, tangled dependencies, missing Completion Contract/Key Risks, unusable outcome, or incomplete risk details
- **Step 4**: Missing branch/planning commit/stage commit + summary, scope changes, direct-only behavior, or too few commits

## Workflows
- **Simple**: Step 2 → Step 3 → Step 4 (feature branch → implement stages → test/commit → complete)
- **Complex**: Step 1 (solution assessment) → Step 2 → Step 3 → Step 4
