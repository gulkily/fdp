> **Feature plan:** [Step 1](./mermaid_diagram_improvement_step1_solution_assessment.md) · [Step 2](./mermaid_diagram_improvement_step2_feature_description.md) · [Step 3](./mermaid_diagram_improvement_step3_development_plan.md) · [Step 4](./mermaid_diagram_improvement_step4_implementation_summary.md)

## Completion Contract

- Allowed documentation scope: the "Workflow at a glance" diagrams, captions, and directly adjacent sentences in `README.md`, plus this feature's `docs/plans/` artifacts. Nothing else may change.
- Intended audience/outcome: FDP adopters grasp both workflows from the diagrams alone, in about one viewport each, with no crossing edges.
- Document completion: both diagrams meet the Step 2 requirements; process meaning is unchanged; the Step 4 summary records render evidence.
- Recovery boundary: a rendering defect is fixed by revising the Mermaid source in a follow-up commit on the branch.
- Evidence boundary: local Mermaid render (if a renderer is available), the Markdown link check, `git diff` scope check, and a GitHub light/dark check after the user authorizes a push.
- Not applicable: runtime, UI, deployment, migration, and release checks.

## Key Risks

- **GitHub renders differently from local tools.** Impact: unnoticed layout or theme defects. Validation: local render in Stage 1–2, GitHub check in Stage 3. Mitigation: simple diagrams; Stage 3 allows corrections.
- **Left-to-right layout is too wide.** Impact: shrunken, unreadable text. Validation: render at laptop width in Stage 1. Mitigation: short labels; fall back to a compact layout if needed.
- **Merged or shortened labels change the apparent process.** Impact: readers misunderstand the workflow. Validation: compare edges to `FEATURE_DEVELOPMENT_PROCESS.md` in Stages 1–2. Mitigation: edge-by-edge review before commit.
- **GitHub check needs a push, which is outward-facing.** Impact: Stage 3 cannot complete without it. Validation: ask the user before pushing. Mitigation: if declined, record the check as pending in the summary.

## Stage 1
- Goal: Rewrite the approval-chain diagram with its caption and the shared `classDef` set.
- Dependencies: Step 3 approved and the feature branch created.
- Expected changes:
  - Bold caption above the first diagram.
  - Left-to-right layout; Planning and Implementation subgraphs.
  - Optional Step 1 with a dotted entry edge.
  - Labeled "Approved Step N" and dotted "Revise" edges.
  - Merged per-stage node.
  - `<br/>` breaks and labels of at most two lines.
  - `classDef` for gates, commits, and stop/return, with no text colors.
- Verification approach:
  - Render locally if possible.
  - Compare every edge to the process text.
  - Confirm the diff touches only `README.md`.
- Risks or open questions:
  - Impact: the diagram is too wide.
  - Early warning / validation: the render looks cramped at laptop width.
  - Mitigation: shorten labels or reduce the node count.
- Canonical components/API contracts touched: `README.md` "Workflow at a glance", first diagram.

## Stage 2
- Goal: Rewrite the return-to-planning diagram with its caption and the identical `classDef` set.
- Dependencies: Stage 1 committed.
- Expected changes:
  - Bold caption above the second diagram.
  - Distinct edge labels: "Scope changed", "No change", "Next stage", "Done".
  - Reordered declarations so no edges cross.
  - Explicit Step 2 node as the return target, reached by a dotted edge.
  - "Revise" on the Step 3 rejection edge.
  - Same `classDef` set and `<br/>` breaks.
- Verification approach:
  - Render locally if possible.
  - Check that no two edges from one decision share a label.
  - Check that each return edge's text matches its target.
- Risks or open questions:
  - Impact: edges still cross.
  - Early warning / validation: the render shows crossings.
  - Mitigation: reorder nodes or restructure subgraphs.
- Canonical components/API contracts touched: `README.md` "Workflow at a glance", second diagram.

## Stage 3
- Goal: Verify on GitHub in both themes, run the document checks, and fix any defects.
- Dependencies: Stages 1–2 committed; user authorization to push the branch.
- Expected changes:
  - Corrections to the Mermaid source only if the GitHub render shows defects.
  - Summary evidence for fit, crossings, and theme legibility.
- Verification approach:
  - GitHub light and dark views of both diagrams.
  - `python scripts/check-markdown-links.py`.
  - `git diff --check`.
  - Final scope check against the allowed files.
- Risks or open questions:
  - Impact: the push is declined or GitHub renders unexpectedly.
  - Early warning / validation: the user's answer to the push request, or a visible defect.
  - Mitigation: record the check as pending, or iterate on the source.
- Canonical components/API contracts touched: `README.md` "Workflow at a glance" (corrections only).
