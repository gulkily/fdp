> **Feature plan:** [Step 1](./examples_page_step1_solution_assessment.md) · [Step 2](./examples_page_step2_feature_description.md) · [Step 3](./examples_page_step3_development_plan.md) · [Step 4](./examples_page_step4_implementation_summary.md)

## Completion Contract

- Allowed scope: `README.md`, `examples/`, and `docs/plans/examples_page_step1_solution_assessment.md` through `examples_page_step4_implementation_summary.md` only.
- Audience/outcome: a prospective FDP user can understand a featured real cycle, select deeper cases, and inspect public evidence without v3 access.
- Document completion/recovery: hub, three case studies, supporting artifacts, and README navigation are coherent; correct broken links, inaccurate summaries, or disclosure concerns in the public copy while retaining the source record's meaning.
- Evidence boundary: compare every decision, verification result, limitation, and commit link with the selected v3 Step 1–4 artifacts before publication.
- Runtime, UI, deployment, migration, and release checks: not applicable; this cycle changes documentation only.

## Key Risks

- **High risk: inaccurate or selective evidence.**
  - Impact: The examples lose credibility.
  - Early validation: Compare each case against its v3 record.
  - Mitigation: Retain material limitations and source/commit references.
- **High risk: disclosure of non-public context.**
  - Impact: Publication exposes unsuitable detail.
  - Early validation: Review copied text and URLs for public suitability.
  - Mitigation: Redact protected context without changing the evidence's meaning.
- **High risk: a dense hub obscures the featured story.**
  - Impact: Newcomers cannot assess FDP quickly.
  - Early validation: Read the hub without opening a case.
  - Mitigation: Lead with a concise four-step case and defer detail.

## Stage 1
- Goal: Establish auditable, public-safe evidence for the selected examples.
- Dependencies: Approved Step 2; selected v3 source artifacts and available commit history.
- Expected changes: Create the `examples/` structure and a source-evidence inventory for Private Window Lobby Fallback, v3 Status Command, and Offline Reading Health Check; record disclosure decisions.
- Verification approach: Compare each retained claim and referenced commit to its v3 Step 1–4 source; check copied material for private paths, identities, credentials, and unsuitable URLs.
- Risks or open questions:
  - Impact: An incomplete or unsafe source copy invalidates dependent case studies.
  - Early warning / validation: A case claim cannot be traced to source evidence or a public link.
  - Mitigation: Resolve the evidence or redact/reframe the claim before Stage 2.
- Canonical components/API contracts touched: `examples/` evidence artifacts; `HN_EXAMPLE_CANDIDATES.md` selection rationale.

## Stage 2
- Goal: Deliver the featured case and an intelligible examples-hub entry.
- Dependencies: Stage 1's approved public evidence for Private Window Lobby Fallback.
- Expected changes: Add the hub and featured case, presenting the problem, option decision, four-step flow, outcome, recovery behavior, verification, and artifact links.
- Verification approach: Read the hub from a newcomer perspective without supporting artifacts; validate all featured-case links, source claims, and relative paths.
- Risks or open questions:
  - Impact: The hub either duplicates raw plans or hides the audit trail.
  - Early warning / validation: The feature story or evidence cannot be understood from the hub.
  - Mitigation: Keep the summary focused and link outward to the case and supporting artifacts.
- Canonical components/API contracts touched: `examples/` hub; Private Window case and evidence artifacts.

## Stage 3
- Goal: Add the medium-complexity operational case study.
- Dependencies: Stage 1's public evidence; Stage 2 hub navigation pattern.
- Expected changes: Add the v3 Status Command case with its decision, reuse boundary, staged delivery, verification, and manual-rebuild limitation; link it from the hub.
- Verification approach: Compare claims with v3 records; validate the hub-to-case-to-evidence path and confirm the limitation remains visible.
- Risks or open questions:
  - Impact: The command can appear more certain than its source permits.
  - Early warning / validation: The case implies a held lock proves a manual rebuild.
  - Mitigation: State the distinction between general protected activity and rebuild state explicitly.
- Canonical components/API contracts touched: `examples/` hub; Status Command case and evidence artifacts.

## Stage 4
- Goal: Add the deep-dive, recovery-oriented case study.
- Dependencies: Stage 1's public evidence; Stage 2 hub navigation pattern.
- Expected changes: Add the Offline Reading Health Check case with its public-data boundary, staged recovery path, verification evidence, and reported unrelated test failures; link it from the hub.
- Verification approach: Compare claims with v3 records; validate case links and confirm the outcome, recovery path, and limitations are all present.
- Risks or open questions:
  - Impact: Simplification can erase privacy boundaries or known verification gaps.
  - Early warning / validation: The case lacks a boundary, recovery action, or stated limitation.
  - Mitigation: Retain these items as explicit case sections before linking it from the hub.
- Canonical components/API contracts touched: `examples/` hub; Offline Reading Health Check case and evidence artifacts.

## Stage 5
- Goal: Make the examples collection discoverable and ready for handoff.
- Dependencies: Stages 2–4.
- Expected changes: Link the hub from `README.md`; complete the documentation-only implementation summary; perform final scope, link, and evidence checks.
- Verification approach: Run `git diff --check`; validate local relative links and referenced public paths; confirm changed files are within scope and every case is reachable from README.
- Risks or open questions:
  - Impact: A correct case study remains undiscoverable or has broken evidence links.
  - Early warning / validation: A clean checkout cannot navigate README → hub → case → evidence.
  - Mitigation: Repair navigation and paths before recording the final summary.
- Canonical components/API contracts touched: `README.md`; `examples/`; Step 4 implementation summary.
