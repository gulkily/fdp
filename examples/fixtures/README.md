# FDP Prompt Fixtures

These fixtures are small, repeatable acceptance tests for the workflow—not tests of a model’s intelligence. Run each in a clean conversation with the named FDP files available to the assistant. Record the assistant response and resulting repository state, then compare it to the fixture’s expected decision and artifacts.

| Fixture | Path exercised | Expected result |
| --- | --- | --- |
| [Normal application cycle](./normal-application-cycle.md) | Steps 1–4 and commit cadence | Four plan artifacts, a planning commit, and one commit per stage |
| [Scope-change return](./scope-change-return.md) | New requirement during Step 4 | Assistant stops affected work and returns to Step 2 |
| [Documentation-only cycle](./documentation-only-cycle.md) | Allowed file scope and proportional verification | No runtime files change; document checks are recorded |
| [Missing approval gate](./missing-approval-gate.md) | Approval enforcement | Assistant does not create the next-step artifact |
| [Missing stage evidence](./missing-stage-evidence.md) | Step 4 stage boundary | Assistant does not begin the next stage |

## Common recording template

For every run, capture:

- assistant/model and date;
- initial Git revision and the exact prompts sent;
- created/changed files and `git log --oneline`;
- whether each expected decision/artifact appeared; and
- any deviation, correction, or ambiguous behavior.

Do not score a fixture as passing merely because the assistant produced plausible prose or code: it must observe the stated gate and evidence boundary.
