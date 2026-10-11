> **Feature plan:** [Step 1](./instruction_debug_mode_step1_solution_assessment.md) · [Step 2](./instruction_debug_mode_step2_feature_description.md) · [Step 3](./instruction_debug_mode_step3_development_plan.md) · [Step 4](./instruction_debug_mode_step4_implementation_summary.md)

## Problem

FDP maintainers lack structured evidence from completed steps about which process instructions help and which add avoidable overhead. Optional diagnostic feedback will support improving FDP itself.

## User Stories

- As an FDP maintainer, I want instruction assessments grounded in completed work so that I can decide what to retain, clarify, consolidate, or remove.
- As an FDP user, I want to enable or disable these diagnostics so that I can contribute maintenance feedback when useful.

## Core Requirements

- Debug mode defaults to disabled; explicit enable/disable requests update a visible mode field in the current planning artifact. Carry that state into subsequent artifacts and check it when resuming after context loss; missing or conflicting state requires clarification, not a silent reset.
- When enabled, each completed Step 1–4 handoff includes one concise summary with **Necessary/useful instructions** and **Redundant/unnecessary instructions** groups, before requesting approval where applicable; phases and implementation stages do not trigger separate summaries.
- Each finding identifies its FDP instruction source and observable contribution or overhead; justified improvement suggestions accompany findings. Empty groups explicitly report no supported findings.
- Inapplicable instructions and uncertain assessments are distinguished from demonstrated redundancy; summaries are selective, not exhaustive inventories.
- Diagnostics preserve required instructions and approval gates; recommendations do not authorize automatic FDP edits. Disabled mode adds no diagnostic output.

## Delivery Scope

**Work type:** Documentation-only FDP maintenance. Allowed documentation scope: `FEATURE_DEVELOPMENT_PROCESS.md`, `README.md`, `docs/dev/feature_process/`, and this feature's planning artifacts under `docs/plans/` (including folder/navigation upkeep if required). The audience is FDP users and maintainers; the outcome is a usable diagnostic workflow. Application/runtime, scripts, tests, CI, deployment, and generated-artifact changes are not permitted.

## Completion Boundary

Complete when the entry guidance, step handoffs, and user documentation consistently define activation, persistence across context loss, reporting, and deactivation. Users can complete a step and receive actionable FDP feedback; incorrect assessments can be corrected during review, and disabling mode restores ordinary handoffs. Handoff requires documentation verification and the Step 4 implementation summary.

## Risks

- **Unsupported judgments:** Could prompt harmful instruction removal. Validate source-and-evidence examples before Step 3; require reasons and distinguish uncertainty or non-applicability.
- **Diagnostic overhead:** Could make FDP harder to use. Validate a short sample before Step 3; keep reporting selective and allow empty groups.
- **Conflicting handoff guidance:** Could omit summaries or weaken approval gates. Check the completion-point inventory before Step 3; use one canonical contract with concise references at applicable handoffs.

## Shared Component Inventory

No UI/API reporting surface exists. Extend the canonical workflow entry in `FEATURE_DEVELOPMENT_PROCESS.md` and existing step-completion guidance in `docs/dev/feature_process/`; reuse their handoffs. `README.md` explains usage. No separate tool or reporting system is needed.

## Simple User Flow

1. The user requests FDP debug mode for the workflow; the assistant records the setting in the current planning artifact.
2. The assistant completes the current step and provides its artifact plus the diagnostic summary.
3. The maintainer reviews evidence and proposed FDP improvements, then approves or requests corrections through the existing process.
4. Later steps inherit the recorded setting, and resumed work checks it before continuing; reporting persists until the user disables debug mode.

## Success Criteria

- All four completed-step handoffs support both summary groups when enabled and no diagnostics when disabled.
- Every reported finding includes an FDP source and observable reason; unsupported classifications are explicitly uncertain or inapplicable.
- Enable, context-loss recovery, disable, missing/conflicting state, empty-group, and phase/stage-boundary scenarios are reviewable from the documentation; existing approval and commit obligations remain intact.
