> **Feature plan:** [Step 1](./instruction_debug_mode_step1_solution_assessment.md) · [Step 2](./instruction_debug_mode_step2_feature_description.md) · [Step 3](./instruction_debug_mode_step3_development_plan.md) · [Step 4](./instruction_debug_mode_step4_implementation_summary.md)

## Completion Contract

- Documentation-only FDP maintenance for users/maintainers: enable diagnostics, complete any Step 1–4, receive actionable instruction feedback, resume with recorded state, and disable diagnostics.
- Allowed scope: `FEATURE_DEVELOPMENT_PROCESS.md`, `README.md`, `docs/dev/feature_process/`, and this feature's `docs/plans/` artifacts plus required folder/navigation upkeep. No application/runtime, scripts, tests, CI, deployment, or generated-artifact changes.
- Complete when canonical guidance, completion handoffs, and usage documentation agree. Correct findings through review; clarify missing/conflicting mode state instead of resetting it. Evidence supports selective assessments, not claims about hidden reasoning or exhaustive instruction use.
- Release/handoff: documentation integrity, source/evidence, links, scope, and scenario reviews pass; Step 4 records results and limitations. Runtime, UI, migration, deployment, and external verification are not applicable.
- After `Approved Step 3`: create the feature branch; commit only approved Steps 1–3 first. Each stage requires verification, a Step 4 summary update, and its own commit before the next stage.

## Key Risks

- **High risk: State loss/conflict** could silently stop diagnostics. Validate enable → context loss → resume → disable; use a visible artifact field, inherited state, and clarification for ambiguity before dependent work.
- **Unsupported judgments** could encourage harmful FDP edits. Early sample: preserving the original query helped retain intent; no observed redundancy means an empty group. Require sources/reasons, separate inapplicable/uncertain findings, and keep suggestions advisory.
- **High risk: Overhead or duplicate reporting** could burden handoffs. Validate a compact sample and completion inventory: Step 1/2 `Next`, Step 3/4 final `after` handoffs; phases/stages are excluded. Centralize the contract and preserve approvals.

## Stage 1

- Goal: Deliver opt-in diagnostics and recoverable state for Steps 1–2 (≤1 hour, about ≤50 changed lines).
- Dependencies: Step 3 approval and initial planning commit; resolve classification/state risks before wiring handoffs.
- Expected changes: Define the canonical activation, artifact-state, resume, classification, and report contract in the overview; connect Step 1/2 entry and completion guidance. Reorganize feature plans when the fourth artifact appears and update plan navigation.
- Verification approach: Review enabled/disabled, inheritance, context-loss recovery, missing/conflicting state, empty groups, and supported/uncertain/inapplicable findings; inspect links and authorized paths.
- Risks or open questions: Ambiguous state could override user intent; validate explicit latest enable/disable requests and require clarification when recovery evidence cannot resolve the setting.
- Canonical components/API contracts touched: `FEATURE_DEVELOPMENT_PROCESS.md`, Step 1/2 canonical instruction files, feature plan navigation; no UI/API surfaces.

## Stage 2

- Goal: Extend the same diagnostic workflow through Steps 3–4 (≤1 hour, about ≤50 changed lines).
- Dependencies: Stage 1 verified and committed; inspect Step 4 guidance after approval permits access.
- Expected changes: Connect state restoration/inheritance and final reporting to Step 3/4 phase guidance and compatibility entrypoints as needed; report only at completed-step handoffs.
- Verification approach: Walk phase/stage and final-completion scenarios; confirm one report per completed step, preserved approval/commit gates, and recoverable state in implementation summaries.
- Risks or open questions: Multiple completion paths could duplicate/omit reports; validate every canonical and compatibility path before accepting the stage.
- Canonical components/API contracts touched: Step 3/4 instructions under `docs/dev/feature_process/`; reuse the overview contract.

## Stage 3

- Goal: Make the workflow discoverable and verify the complete documentation slice (≤1 hour, about ≤50 changed lines).
- Dependencies: Stage 2 verified and committed; resolve remaining scenario discrepancies before handoff.
- Expected changes: Add README usage covering enable/disable, context recovery, concise diagnostic output, and advisory FDP improvements; complete the implementation summary.
- Verification approach: Review all Step 2 success scenarios; run existing Markdown link checks and `git diff --check`; audit allowed paths, navigation, source/evidence claims, and planning/stage commit cadence. Record results without claiming execution guarantees from documentation alone.
- Risks or open questions: Examples could diverge from canonical guidance; compare each example against the shared contract and correct mismatches before release.
- Canonical components/API contracts touched: `README.md`, feature planning artifacts; existing check scripts are executed unchanged.
