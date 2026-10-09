# FDP Failure Modes and Recovery

FDP is intentionally strict at the points where AI-assisted work most often becomes hard to review. Treat these as stop conditions, not workarounds.

## Approval was skipped

**Signal:** The assistant starts a later step or changes implementation before the user explicitly says `Approved Step N`.

**Recovery:** Stop. Review or revise the current artifact; do not keep later work as implicitly approved. Resume only from the last explicitly approved step. If implementation began before `Approved Step 3`, discard or set aside the unapproved implementation and return to planning.

## Scope expands during Step 4

**Signal:** A newly discovered requirement, new user flow, additional integration, schema change, or material risk is needed to finish a stage.

**Recovery:** Do not fold it into the stage. Record the discovery in the Step 4 summary, finish only the still-valid approved scope if safe, and return to Step 2 (then Step 3) for the expanded work. A new branch or follow-up feature is often clearer.

## The work is documentation-only

**Signal:** The intended outcome is a document, not runtime behavior.

**Recovery:** Step 2 must call it documentation-only, name the allowed documentation paths, intended audience/outcome, and prohibit application/runtime changes. Step 3 carries that boundary into its Completion Contract. Step 4 verifies document integrity, evidence, local links/paths, and changed-file scope; runtime, UI, deployment, migration, and release checks are marked not applicable with a reason.

## Verification or a stage commit is missing

**Signal:** A planned stage is implemented but its verification is not recorded, its Step 4 summary is not updated, or the work is mixed into a later commit.

**Recovery:** Do not begin the next stage. Run the applicable check, update the current stage section, inspect `git status --short`, and create the missing stage-scoped commit. If later work is already mixed in, separate it into reviewable commits before continuing; record any limitation honestly.

## A risk blocks a dependent stage

**Signal:** A Step 2 or Step 3 risk has no accepted mitigation or its early validation fails.

**Recovery:** Mark the dependent stage blocked. Resolve, reduce, or re-plan the risk before advancing. Do not make a speculative implementation change simply to keep the sequence moving.

## Minimal pre-handoff check

```bash
git diff --check
git status --short
git log --oneline
```

Then confirm that the first Step 4 commit contains only approved Steps 1–3, every completed stage has a summary update and commit, and the final artifact satisfies the Step 3 Completion Contract.
