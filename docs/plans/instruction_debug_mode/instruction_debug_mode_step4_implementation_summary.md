> **Feature plan:** [Step 1](./instruction_debug_mode_step1_solution_assessment.md) · [Step 2](./instruction_debug_mode_step2_feature_description.md) · [Step 3](./instruction_debug_mode_step3_development_plan.md) · [Step 4](./instruction_debug_mode_step4_implementation_summary.md)

Debug mode: disabled

## Stage 1 - Canonical contract and Steps 1–2

- Changes: Added optional FDP diagnostics, durable artifact state, context recovery, evidence-based classifications, and Step 1/2 entry/completion references. Grouped all four feature artifacts and added plan navigation.
- Verification: Manual scenario review covered enable/disable, inheritance, resumption, missing/conflicting state, empty groups, and inapplicable/uncertain assessments; source-and-evidence requirements and approval gates retained. Local Markdown link checks, whitespace, and authorized-file-scope checks passed.
- Notes: This workflow has not requested debug mode, so its recorded mode is disabled. Runtime, UI, deployment, migration, and release checks are not applicable: changes define a documentation workflow, with no runtime changes. Behavioral adherence remains dependent on the assistant following these instructions.

## Stage 2 - Steps 3–4 and compatibility paths

- Changes: Added mode restoration/inheritance to Step 3/4 entry and execution phases and compatibility entrypoints; connected diagnostics only to final completed-step handoffs.
- Verification: Manual path review covered canonical and compatibility entry, phase resumption, stage boundaries, Step 4 summary state, and final handoffs. All four steps reference the shared contract; phases/stages do not emit separate reports. Existing approval and planning/stage commit gates remain intact. `python3 scripts/check-markdown-links.py`, `git diff --check`, source/evidence review, and authorized-file-scope checks passed.
- Notes: State-loss and duplicate-report risks are addressed by explicit restoration and final-handoff instructions. Runtime, UI, deployment, migration, and release checks are not applicable because this stage changes documentation only.
