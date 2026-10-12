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

## FDP Debug Mode

Debug mode is optional feedback for **debugging and improving FDP itself**. It defaults to disabled for a new workflow. Users enable or disable it with plain-language requests such as “Enable FDP debug mode for this workflow” or “Disable FDP debug mode.”

**Durable state and recovery**:
- Record `Debug mode: enabled` or `Debug mode: disabled` immediately below the Plan navigation bar in the current artifact; carry the setting into every subsequent artifact, including Step 4. If no artifact exists yet, record it when creating the first one.
- On entry to a step, after context loss, and before its completion handoff, read this contract and the current artifact's mode field. If the next artifact does not exist, inherit from the latest completed artifact. Historical artifacts are snapshots, not competing current settings.
- An explicit latest user enable/disable request takes precedence; update the current field accordingly. Missing state is disabled only for a clearly new workflow with no enable request. For resumed work, ask for clarification if state is missing or conflicting and cannot be resolved from available evidence; do not silently reset it.
- Mode changes alone do not approve a step or authorize advancing, branching, or committing. During Step 4, record state changes in the summary and include them in the next authorized stage commit; do not amend completed commits.

**Completion report**: When enabled, append one concise diagnostic summary to the completed Step 1–4 handoff, before requesting approval where applicable. Do not report separately for phases or implementation stages. A revision updates the step's findings rather than accumulating duplicate reports. When disabled, omit diagnostic output.

- Always include **Necessary/useful instructions** and **Redundant/unnecessary instructions**. Say “No supported findings” for an empty group.
- Each finding names its FDP source (file and section or short instruction excerpt), cites observable contribution or overhead in this step, and suggests retention, clarification, consolidation, or removal where justified.
- Put relevant **Inapplicable instructions** and **Uncertain assessments** in separately labeled groups; never infer redundancy merely from non-use. Report selectively, without claiming exhaustive coverage or access to hidden reasoning.
- Findings are advisory. Continue following required instructions and approval/commit gates; suggested FDP changes need their own authorized work.

## Planning Artifacts
Each step MUST be a separate file in `docs/plans/`:
- **Step 1**: `{feature_name}_step1_solution_assessment.md`
- **Step 2**: `{feature_name}_step2_feature_description.md`
- **Step 3**: `{feature_name}_step3_development_plan.md`
- **Step 4**: `{feature_name}_step4_implementation_summary.md`

**Directory structure and organization rule**: After explicit `Approved Step 3` and creation of the Step 4 feature branch, organize the current feature's planning artifacts in `docs/plans/{feature_name}/` before the first commit or implementation, regardless of artifact count or whether Step 1 was skipped. Reuse an existing feature folder. Preserve filenames and separate step files; update relative Feature plan navigation links, affected repository references, and the `docs/plans/README.md` entry as needed.

The initial planning commit contains only approved Step 1–3 documents (Steps 2–3 if Step 1 was skipped), plus the moves, index entries, and reference fixes needed for this feature's organization. Exclude implementation changes, the Step 4 summary, unrelated plans, and unapproved auxiliary content. Organization permits no substantive revisions to approved planning content or changes to its debug-mode state. Create the Step 4 summary later, after the planning commit, in the same folder, inheriting debug mode from Step 3 under the [FDP Debug Mode](#fdp-debug-mode) recovery rules.

This narrow organization allowance qualifies the [detailed Step 4 planning-commit gate](docs/dev/feature_process/step4_implementation_before.md#planning-docs-commit-gate-required), including its “only approved documents” requirement and restriction on altering approved planning documents during setup.

**Plan navigation**: Start every artifact with this relative-link bar; omit Step 1 only when skipped.

```md
> **Feature plan:** [Step 1](./{feature_name}_step1_solution_assessment.md) · [Step 2](./{feature_name}_step2_feature_description.md) · [Step 3](./{feature_name}_step3_development_plan.md) · [Step 4](./{feature_name}_step4_implementation_summary.md)
```

**Commit discipline**:
- Keep Step 1-3 planning documents uncommitted while they are being drafted/revised.
- Do not commit Step 1-3 planning documents when Step 1 or Step 2 is approved.
- After the user explicitly responds `Approved Step 3`, create the Step 4 feature branch.
- Before the first commit on that feature branch, apply the organization rule above; limit that commit to its approved planning documents and organization allowance.
- During Step 4, each completed stage must be committed with its Step 4 summary update in the same commit before starting the next stage.

**Plan review**: Do not begin Step 4 until the user explicitly responds `Approved Step 3`. Organize and commit the approved planning files under the organization rule above before implementation.

**Step 4 commit cadence (mandatory)**:
- Make one planning commit at the start of Step 4 under the organization rule above, including only approved planning documents and its organization allowance.
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
- Enforce Step 4 commit cadence: organize and commit approved planning docs under the organization rule above first; each completed stage has a stage-scoped commit that includes the Step 4 summary update
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
