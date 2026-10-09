> **Feature plan:** [Step 1](./mermaid_diagram_improvement_step1_solution_assessment.md) · [Step 2](./mermaid_diagram_improvement_step2_feature_description.md) · [Step 3](./mermaid_diagram_improvement_step3_development_plan.md) · [Step 4](./mermaid_diagram_improvement_step4_implementation_summary.md)

## Original Query

Improve the two Mermaid diagrams in the "Workflow at a glance" section of README.md. Both currently render as tall, narrow columns that take several screens of scrolling on GitHub, so the main goal is to make each one readable at a glance without changing what the process says.

For the first diagram (the approval chain), switch from flowchart TD to flowchart LR, and group the nodes into two subgraphs titled "Planning (uncommitted, docs/plans/)" and "Implementation (feature branch)" so the branch boundary after Step 3 is visible. Shorten the node labels: drop the repeated "create plan artifact" line from Steps 1 to 3 and use a short form such as "Step 2: Feature description". Replace the three large "Approved Step N?" diamonds with labeled edges where possible (a forward edge labeled "Approved Step N" and a dotted back edge labeled "Revise"), or at minimum keep the diamonds but shorten their text to "Approved?". Mark Step 1 as optional in its label and render its entry edge as dotted. Merge "Step 4 Stage N: implement + verify + update summary" and "Commit stage N + its Step 4 summary update" into one node, since they describe a single per-stage unit.

For the second diagram (returning to planning), fix the ambiguous routing near the bottom: two edges labeled "Yes" currently sit side by side under the "New requirement, risk, or scope change?" diamond, and one of them actually belongs to "More stages?", so it is hard to tell which decision each comes from. Give each edge a distinct label ("Scope changed", "No change", "Next stage", "Done"), and reorder the node declarations so the loop back to Step 4 and the return-to-planning edge do not cross. The "Stop the affected work and return to Step 2" node says Step 2, but its edge runs all the way back up to the combined "Steps 1–3" box; point it at an explicit Step 2 node, or reword the label so the text and the arrow agree. Render that return edge as a dotted line so it reads as the exception path, and use "Revise" instead of "No" on the Step 3 approval edge to match the first diagram.

Apply these to both: add a one-line bold caption above each diagram stating what it shows, since right now two similar flowcharts appear back to back with no label. Use `<br/>` instead of `\n` for line breaks in labels. Add a small classDef set used identically in both diagrams (for example, one class for approval gates, one for commit points, one for the stop/return node), with fill and stroke colors that stay legible in both GitHub light and dark themes, and do not hard-code text colors. Keep every label to at most two short lines. After editing, check the rendered README on GitHub in both themes and confirm each diagram fits in roughly one viewport with no crossing edges.

## Understood Intent

Make the two README workflow diagrams compact, unambiguous, and theme-safe on GitHub while keeping the documented process unchanged.

## Problem

The two "Workflow at a glance" diagrams render as tall columns with ambiguous edge labels and a Step 2 label that points at a Steps 1–3 node.

## Option A — Revise the Mermaid source in place, following the requested edits.

Keep both diagrams as Mermaid in `README.md`: switch the approval chain to left-to-right with Planning and Implementation subgraphs, shorten labels, merge the per-stage nodes, disambiguate the return-to-planning edges, and share one `classDef` set and bold captions across both.

- Pros
  - Stays text-based, diffable, and editable by anyone; GitHub renders both themes natively.
  - Directly implements the detailed requested changes.
- Cons
  - Rendering is owned by GitHub and cannot be fully verified locally.
  - Left-to-right layouts can shrink on narrow viewports if too wide.

## Option B — Replace the Mermaid blocks with committed SVG or PNG images.

Hand-draw or export the diagrams to image files in the repository and embed them in the README, giving full control over layout and edge routing.

- Pros
  - Pixel-exact layout with no crossing edges, regardless of renderer.
- Cons
  - Images drift from the process text, are hard to review in diffs, and need light/dark variants.
  - Adds a build or export step and binary files to a documentation-only repository.

## Option C — Collapse to one simpler diagram and move detail elsewhere.

Show only a single high-level flow in the README and move the return-to-planning detail into the process document or prose.

- Pros
  - Smallest README footprint and least rendering risk.
- Cons
  - Removes information the user asked to keep ("without changing what the process says").
  - Changes scope from improving the diagrams to restructuring the documentation.

## Recommendation

Choose **Option A**. It is a documentation-only vertical slice: a reader opening the README sees both diagrams fit in about one viewport, with clear gates and an unambiguous exception path, verified on GitHub in light and dark themes. Step 2 should name `README.md` as the only allowed file scope and state that process content is unchanged.
