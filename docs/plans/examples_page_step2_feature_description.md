> **Feature plan:** [Step 1](./examples_page_step1_solution_assessment.md) · [Step 2](./examples_page_step2_feature_description.md) · [Step 3](./examples_page_step3_development_plan.md) · [Step 4](./examples_page_step4_implementation_summary.md)

## Problem

FDP explains its rules but does not yet give prospective users a quick, auditable view of how those rules guided real features. Readers need an examples hub that leads them from a concise case to deeper evidence without hiding limitations.

## User Stories

- As a prospective FDP user, I want to understand one complete feature cycle quickly so that I can judge whether the process fits my work.
- As a process-minded reader, I want to inspect decisions, plans, verification, and commits for several examples so that I can audit the claims.
- As an FDP maintainer, I want public examples to preserve risks and incomplete verification so that the page remains credible as source material for an HN writeup.

## Core Requirements

- Provide an examples hub with Private Window Lobby Fallback as the featured, concise four-step case.
- Provide separate case studies for v3 Status Command and Offline Reading Health Check, each linked from the hub and its source artifacts.
- State each case's problem, decision, staged delivery, outcome, verification, and material limitation or recovery behavior.
- Keep public examples faithful to their v3 sources while redacting only non-public or irrelevant repository-specific detail.
- Use stable relative links from the hub to every case and from each case to its supporting public artifacts and commits when available.

## Delivery Scope

- Work type: documentation-only.
- Allowed documentation scope: `README.md`; `examples/`; `docs/plans/examples_page_step1_solution_assessment.md`; `docs/plans/examples_page_step2_feature_description.md`; `docs/plans/examples_page_step3_development_plan.md`; and `docs/plans/examples_page_step4_implementation_summary.md`.
- Intended audience/outcome: prospective FDP users can understand and audit real feature cycles before deciding whether to adopt the process.
- Application/runtime changes are not permitted, including source, tests, CI, deployment configuration, generated artifacts, or runtime behavior.

## Completion Boundary

- Normal entry: a reader follows the README to the examples hub.
- End-to-end outcome: the reader understands the featured case in minutes, can select a medium or deep-dive case, and can follow supporting evidence without a private v3 checkout.
- Needed recovery: a broken link, inaccurate summary, or disclosure concern is corrected in the public example and hub while preserving the original decision and verification record.
- Handoff condition: the README, hub, cases, artifacts, and available commit links are coherent and ready to support the HN writeup.

## Risks

- **Source drift or inaccurate summaries** — Early validation: compare every stated decision, result, and limitation to the selected v3 artifact. Mitigation: retain source links and review each case against its Step 1–4 record before Step 3.
- **A page that is too dense for newcomers** — Early validation: confirm the featured case is intelligible without opening a supporting artifact. Mitigation: keep the hub summary-first and move detail to case studies.
- **Sensitive or confusing source context** — Early validation: perform a public-disclosure review of copied artifacts and commit links. Mitigation: redact only protected context and state any omitted verification rather than implying it occurred.

## Shared Component Inventory

- `README.md`: extend as the canonical FDP entry point with one link to the examples hub.
- `HN_EXAMPLE_CANDIDATES.md`: reuse as the selection rationale; it remains a maintainer-facing source, not the reader-facing hub.
- `examples/`: new documentation surface, justified because no existing page presents public case studies.
- `docs/plans/examples_page_*.md`: retain as the canonical planning and implementation record for this documentation-only cycle.

## Simple User Flow

1. A reader opens FDP's README and selects Examples.
2. The hub presents Private Window Lobby Fallback's problem, decision, four-step flow, outcome, and evidence.
3. The reader opens Status Command or Offline Reading Health Check for a broader case study.
4. The reader follows public artifacts and commits to inspect supporting detail.

## Success Criteria

- A first-time reader can identify FDP's role, the featured feature's outcome, and its verification evidence without leaving the hub.
- All three selected cases expose an auditable path to their public Step 1–4 evidence.
- Each case preserves at least one material risk, limitation, or recovery behavior from its source record.
- No change falls outside the named documentation scope.
