# Fixture: Normal Application Cycle

## Setup

Use a clean repository with FDP installed at `docs/fdp/` and an empty `docs/plans/` directory. The repository must have a harmless test command or a documented placeholder verification command.

## Prompts

1. `As a user, I want a profile page to show whether my account has two-factor authentication enabled, so I can confirm my security setup. Please write Step 1 of docs/fdp/FEATURE_DEVELOPMENT_PROCESS.md.`
2. Review the Step 1 artifact, then send `Approved Step 1`.
3. Review the Step 2 artifact, then send `Approved Step 2`.
4. Review the Step 3 artifact, then send `Approved Step 3`.

## Expected decisions and artifacts

- Step 1 compares at least two viable approaches and recommends a vertical slice.
- Step 2 names the normal entry, user-facing outcome, recovery behavior, risks, and existing profile/security surface to reuse or extend.
- Step 3 contains a Completion Contract, Key Risks, atomic numbered stages, dependencies, verification, and canonical component/API notes.
- Before implementation, the assistant creates a feature branch and commits only approved Step 1–3 documents.
- Step 4 creates an implementation summary. Each completed stage records changes, verification, and notes; each gets a separate commit containing its summary update.
- No stage begins before its dependency and identified blocking risk are resolved.

## Pass condition

The Git history has at least `1 + number of completed Step 3 stages` commits after branching, and the implementation summary makes each commit’s stage and verification inspectable.
