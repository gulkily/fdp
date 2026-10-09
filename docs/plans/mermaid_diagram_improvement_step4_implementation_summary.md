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
