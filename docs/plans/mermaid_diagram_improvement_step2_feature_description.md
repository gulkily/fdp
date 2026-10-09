> **Feature plan:** [Step 1](./mermaid_diagram_improvement_step1_solution_assessment.md) · [Step 2](./mermaid_diagram_improvement_step2_feature_description.md) · [Step 3](./mermaid_diagram_improvement_step3_development_plan.md) · [Step 4](./mermaid_diagram_improvement_step4_implementation_summary.md)

## Problem

The two "Workflow at a glance" Mermaid diagrams in `README.md` render as tall, narrow columns that need several screens of scrolling. Ambiguous edge labels and a "return to Step 2" node that points at a "Steps 1–3" box make them harder to read than the process they describe.

## User Stories

- As a new FDP adopter, I want each workflow diagram to fit in about one viewport so that I can understand the process at a glance.
- As a reader of the second diagram, I want each decision's outgoing edges labeled distinctly so that I know which decision every path comes from.
- As a reader in GitHub light or dark theme, I want gate, commit, and stop nodes visually distinct and legible so that the key checkpoints stand out.

## Core Requirements

- Approval-chain diagram: left-to-right layout; "Planning (uncommitted, docs/plans/)" and "Implementation (feature branch)" subgraphs; short labels; Step 1 marked optional with a dotted entry edge; approval gates shown as labeled edges ("Approved Step N" forward, dotted "Revise" back) or at minimum shortened "Approved?" diamonds; the per-stage implement/verify/commit steps merged into one node.
- Return-to-planning diagram: distinct labels on every decision edge ("Scope changed", "No change", "Next stage", "Done"); no crossing edges; the return node points at an explicit Step 2 node; the return edge is dotted; the Step 3 rejection edge reads "Revise".
- Both diagrams: a one-line bold caption above each; `<br/>` for line breaks; at most two short lines per label; one identical `classDef` set (approval gates, commit points, stop/return) with fill and stroke only, no hard-coded text colors, legible in both GitHub themes.
- The process meaning of both diagrams is unchanged, and the surrounding README prose stays accurate.

## Delivery Scope

- Work type: documentation-only.
- Allowed files: the two Mermaid blocks, their captions, and any directly adjacent sentence in the "Workflow at a glance" section of `README.md`, plus the Step 1–4 planning artifacts under `docs/plans/`.
- Intended audience and outcome: FDP adopters reading the README who should grasp the workflow from the diagrams alone.
- Application source, scripts, tests, CI, deployment configuration, generated artifacts, and other documentation are not permitted to change. If one becomes necessary, return to Step 2 for approval.

## Completion Boundary

- Document completion: both diagrams in `README.md` meet the requirements above and have been checked on GitHub in light and dark themes.
- Audience outcome: each diagram is readable in about one viewport with no crossing edges, and every decision edge is unambiguous.
- Correction path: if GitHub rendering shows a defect, revise the Mermaid source in a follow-up stage before handoff.
- Handoff condition: all stage commits are on the feature branch and the Step 4 summary records the GitHub rendering evidence.

## Risks

- **GitHub renders Mermaid differently from local tools.** Impact: layout or theme defects go unnoticed. Earliest validation: preview in a Mermaid renderer during drafting, then check the real README on GitHub after push. Mitigation: keep diagrams simple, and budget a correction stage.
- **Left-to-right layout becomes too wide and shrinks text.** Impact: the diagram is unreadable on narrow viewports. Earliest validation: render the draft and view it at laptop width. Mitigation: short labels and the subgraph split; fall back to a compact top-down layout if needed.
- **Shortened labels or merged nodes change the apparent process.** Impact: readers misunderstand the workflow. Earliest validation: compare each edge against the Workflow bullets in the README and `FEATURE_DEVELOPMENT_PROCESS.md`. Mitigation: review the merged "Stage N" node and gate edges against the process text before approval.

## Shared Component Inventory

- `README.md` "Workflow at a glance" is the only surface that renders these diagrams; revise it in place.
- `FEATURE_DEVELOPMENT_PROCESS.md` holds the authoritative process text and is read-only reference for this work.
- No UI, API, or runtime components apply.

## User Flow

1. A reader opens the README on GitHub and scrolls to "Workflow at a glance".
2. They read the bold caption and see the approval chain in one viewport, with the branch boundary visible after Step 3.
3. They read the second caption and see how a scope change returns work to Step 2 and how normal stages loop.
4. They identify gates, commits, and the stop/return node by color in either theme.

## Success Criteria

- Each diagram fits in roughly one viewport on GitHub at desktop width with no crossing edges.
- No two outgoing edges from any decision node share a label, and every return edge's text matches its target.
- Both diagrams use the same `classDef` set and no hard-coded text colors; they are legible in GitHub light and dark themes.
- `git diff` shows changes only to the allowed `README.md` section and `docs/plans/` artifacts, and the repository's Markdown link check passes.
