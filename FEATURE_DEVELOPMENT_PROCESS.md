# Feature Development Process

## Overview
Feature work flows through four tightly scoped steps with an optional solution assessment upfront. To keep the instructions inside the context window, the detailed guidance for each step now lives in separate files that you open only when you are ready for that step.

## How to Use This Chain
1. Start with the highest-numbered approved step (usually Step 1 unless explicitly skipped).
2. Read only the dedicated step file in `docs/dev/feature_process/`, complete that deliverable, and request approval in the format “Approved Step N.”
3. Do not open the next file until the user replies with the exact approval phrase.
4. Reprint the instructions from the relevant file before you begin working on that step’s deliverable.

## Step Guide
- **Step 1 – Solution Assessment (Optional)**: resolve uncertainty across multiple approaches. `docs/dev/feature_process/step1_solution_assessment.md`
- **Step 2 – Feature Description**: capture problem framing, user stories, requirements, and success criteria. `docs/dev/feature_process/step2_feature_description.md`
- **Step 3 – Development Plan**: break the work into atomic stages with dependencies, verification notes, and shared component references. `docs/dev/feature_process/step3_development_plan.md`
- **Step 4 – Implementation**: execute staged work on a feature branch and maintain the implementation summary. `docs/dev/feature_process/step4_implementation.md`

Each file ends with instructions for when to proceed to the next step so you never overrun the context window.

## Planning Artifacts
Each step MUST be a separate file in `docs/plans/`:
- **Step 1**: `{feature_name}_step1_solution_assessment.md`
- **Step 2**: `{feature_name}_step2_feature_description.md`
- **Step 3**: `{feature_name}_step3_development_plan.md`
- **Step 4**: `{feature_name}_step4_implementation_summary.md`

**Directory structure**: When a feature accumulates four or more planning artifacts (e.g., all Step 1–4 docs plus auxiliary notes), move them into `docs/plans/{feature_name}/`. Keep smaller efforts at the root until they grow, and update `docs/plans/README.md` when a new folder appears so others can navigate.

**Commit discipline**: Keep each stage’s document uncommitted until the user reviews it. Commit only after approval and immediately before starting the next stage to keep IDE “dirty file” views meaningful.

**Plan review**: Do not commit Step 1–3 plan files until the user explicitly reviews and approves them. Deliver the drafts for feedback, wait for “Approved Step N,” then commit before beginning the next step. Step 4 must start on a feature branch with the approved plan already committed.

## Key Rules

**AI coding assistant**
- Recommend Step 1 for complex features or whenever multiple solutions exist
- Stay in the current step; do not draft/edit later deliverables without approval
- After delivering each step, explicitly request “Approved Step N” and pause until the user responds with that exact phrase
- Create separate files for each step only after receiving the relevant approval
- ALWAYS create a feature branch before Step 4 implementation
- Prefer shared components/API contracts first; reuse or extend instead of forking markup, CSS, or payloads
- Flag scope creep early and bounce back to planning steps rather than improvising mid-implementation
- Keep projected work within roughly a day or eight Step 3 stages; otherwise recommend splitting the feature
- Avoid database schema changes when possible—lean on existing models/fields
- Reprint each step’s instructions (from the linked file) before you begin that step

**User**
- Review and approve explicitly at each step
- Flag issues early so adjustments happen before implementation
- Resist adding scope during Step 4
- Prefer solutions that avoid database migrations; rely on existing schema where feasible

## Warning Signs
- **Step 1**: >1 page, >4 options, or verbose explanations
- **Step 2**: >1 page, includes code/DB details, or drifts into UI mockups
- **Step 3**: >1 page, stages >2 hours, or tangled dependencies
- **Step 4**: Missing feature branch, skipping stages, or changing requirements mid-flight

## Workflows
- **Simple**: Step 2 → Step 3 → Step 4 (feature branch → implement stages → test/commit → complete)
- **Complex**: Step 1 (solution assessment) → Step 2 → Step 3 → Step 4
