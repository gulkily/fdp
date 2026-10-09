> **Feature plan:** [Step 1](./mermaid_diagram_improvement_step1_solution_assessment.md) · [Step 2](./mermaid_diagram_improvement_step2_feature_description.md) · [Step 3](./mermaid_diagram_improvement_step3_development_plan.md) · [Step 4](./mermaid_diagram_improvement_step4_implementation_summary.md)

## Stage 1 - Approval-chain diagram
- Changes:
  - `README.md`: first Mermaid diagram rewritten as `flowchart LR` with Planning and Implementation subgraphs.
  - Bold caption added above it.
  - Step 1 marked optional with a dotted entry edge; gates are labeled "Approved Step N" edges with dotted "Revise" self-loops.
  - Per-stage implement/verify/commit merged into one node.
  - Shared `classDef` set (gate, commit, stop) defined with translucent fills and no text colors; `gate` and `commit` applied.
- Verification:
  - Local render with `@mermaid-js/mermaid-cli` 12.0.0: one row, no crossing edges, all labels at most two lines.
  - Edges compared to the process text in `FEATURE_DEVELOPMENT_PROCESS.md`; process meaning unchanged.
  - `git diff --check` passed; changed files within scope (`README.md` plus this summary).
  - Link check: only the Step 4 summary links failed before this file existed.
  - Runtime, UI, deployment, migration, and release checks: not applicable.
- Notes:
  - The `stop` class is defined but first used in Stage 2.
  - GitHub light/dark rendering is checked in Stage 3.

## Stage 2 - Return-to-planning diagram
- Changes:
  - `README.md`: second Mermaid diagram rewritten as `flowchart LR` with a bold caption.
  - Decision edges labeled distinctly: "Scope changed", "No change", "Next stage", "Done".
  - The return node now targets an explicit Step 2 node over a dotted edge; the Step 3 rejection edge reads "Revise".
  - Same `classDef` set as Stage 1 (gate, commit, stop), applied to the decisions, the commit node, and the return node.
- Verification:
  - Local render with `@mermaid-js/mermaid-cli` 12.0.0: one row, no crossing edges, no shared labels on any decision's outgoing edges.
  - The return edge's text ("return to Step 2") matches its target node.
  - `git diff --check` and Markdown link check passed; changed files within scope.
  - Runtime, UI, deployment, migration, and release checks: not applicable.
- Notes:
  - The explicit Step 2 node omits the optional Step 1; the first diagram covers that path.
  - GitHub light/dark rendering is checked in Stage 3.
