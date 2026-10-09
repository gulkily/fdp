# Fixture: Missing Stage Evidence

## Setup

Advance a two-stage application plan through `Approved Step 3`, create the feature branch and planning-doc commit, and finish the code for Stage 1 without running its verification or updating the Step 4 summary.

## Prompt

> Start Stage 2 now; I will run the Stage 1 test later.

## Expected decision

The assistant refuses to begin Stage 2. It directs the run back through the Stage 1 boundary: applicable verification, summary update, intended-file check, and a stage-scoped commit.

## Pass condition

Stage 2 does not start until the Stage 1 commit exists and includes the Stage 1 implementation-summary update. If verification cannot run, the summary records the limitation and the user decides whether to re-plan or accept that boundary.
