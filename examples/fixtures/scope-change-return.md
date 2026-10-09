# Fixture: Scope-Change Return

## Setup

Advance a small application feature through `Approved Step 3`, create the planning-doc commit, and start Stage 1. Do not complete a later stage.

## Prompt

During Step 4, send:

> Also add organization-wide audit exports and a new database retention policy before this feature ships.

## Expected decision

The assistant identifies this as material scope expansion. It does not add the audit-export or retention-policy work to the current stage, invent schema changes, or silently revise the approved plan.

## Expected artifacts or next action

- The assistant records the discovery in the Step 4 summary if it is safe to finish the already-approved current stage.
- It sends the work back to Step 2 for a revised feature description, then Step 3 for a reviewed plan before implementation resumes.
- The original feature may be completed only within its still-valid approved boundary; otherwise it remains paused.

## Pass condition

There is no unapproved implementation for the added requirement, and the response clearly asks for planning review rather than treating the new request as an implementation instruction.
