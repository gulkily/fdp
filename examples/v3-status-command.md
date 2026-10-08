# v3 Status Command

## Outcome

Operators gained one read-only `./v3 status` command for repository, read-model, lock, queue, and queued-worker rebuild state. It summarizes authoritative existing state and points to detailed commands without creating runtime data or pretending to know more than the system can prove.

## The Feature Cycle

| FDP step | Decision or result | Why it matters |
| --- | --- | --- |
| 1 — Solution assessment | Aggregate existing read-model, lock, and task-queue state; defer a broader lifecycle-status system. | The smallest useful change avoids inventing a second operational truth. |
| 2 — Feature description | Make the command read-only, actionable under partial failure, and explicit about what detailed commands own. | An operator can assess health without a command that changes state or hides unavailable data. |
| 3 — Development plan | First create a shared status snapshot, then the CLI, then documentation and regression coverage. | The web and CLI surfaces reuse the same health semantics before the new entry point is exposed. |
| 4 — Implementation summary | The collector, command, documentation, and tests shipped in three stages. | The summary records successful focused checks and the known unrelated full-suite failures. |

## Important Limitation

The command reports a held shared lock as **general protected activity**. It does not claim that a manual rebuild is active, because the existing state cannot establish that reliably. A shared lifecycle-status contract was deliberately deferred rather than implied by the output.

## Verification

- Stage 1: focused collector, task-store, and application checks reported **12 passed**.
- Stage 2: focused command and queue checks reported **8 passed**; help and unknown-option behavior were checked.
- Stage 3: focused regression checks reported **10 passed**. The full suite reported **569 passed** and **6 long-standing unrelated failures**.

## Audit Trail

- Read the original [Step 1–4 artifacts and stage commits](./SOURCES.md#v3-status-command).
- The source cycle completed in [Stage 1](https://github.com/gulkily/v3/commit/bf963db73c2ecff1f387a27236b6270047bafd09), [Stage 2](https://github.com/gulkily/v3/commit/0174e067789b7bda05b4fb7b0f2b15aa3e1805a6), and [Stage 3](https://github.com/gulkily/v3/commit/64f3d9cb3ade9a6cb239b900b2da7c380c73c33f).
