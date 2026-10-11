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

## Stage 3 - Usage and final verification

- Changes: Added README enable/disable prompts, durable-state recovery, illustrative source-backed output, and advisory improvement guidance. Completed all three approved stages on `feature/instruction-debug-mode`.
- Verification: Python 3 and Perl link checks passed for all 49 Markdown files; `git diff --check`, diagnostic anchor checks, allowed-path review, plan navigation, and commit-content checks passed. Each stage includes this summary; the first commit contains only approved Steps 1–3. Node.js is unavailable, so its optional equivalent link checker was not run; the documented Python and Perl alternatives passed.
- Scenario review: A new workflow defaults off; explicit enable records on; later artifacts inherit; context recovery reads the current field; explicit disable records off and suppresses reports; unresolved missing/conflicting resumed state asks for clarification. Steps 1–4 each have a final report hook; phases/stages have none. Empty groups report no supported findings; inapplicable/uncertain assessments remain separate; citations/reasons are mandatory. Revisions replace findings rather than duplicate them.
- Evidence boundary: These are documentation/path and manual scenario checks, not a live assistant execution guarantee. The README example reflects the preserved original-query categories and clarified FDP-maintenance purpose in Step 1; it is illustrative, not a claim that debug mode was enabled for this workflow.
- Notes: Runtime, UI, migration, deployment, external-system, role, and release-environment checks are not applicable because no executable or deployed system changed. Required instructions and approval/commit gates remain in force. No outstanding scope changes.

## Handoff

- Planning commit: `1d887a2`; Stage 1: `00222d4`; Stage 2: `d3ffc48`; Stage 3: the commit containing this finalized section.
- Documentation is ready for review; no merge or publication was performed. Enable diagnostics with “Enable FDP debug mode for this workflow.”
