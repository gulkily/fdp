# Step 4: Implementation (After)

_Open only after completing Step 4 Do._

## Objective
Run final Step 4 verification gates and prepare handoff.

## Final Verification Checklist
1. Confirm all planned stages were completed and applicable verification was recorded. For documentation-only work, confirm each stage ran the required document-integrity, evidence, link/path, and authorized-file-scope checks, and that each runtime check marked not applicable includes its reason.
2. Confirm each completed stage has a stage-scoped commit that includes the corresponding Step 4 summary update.
3. Run `git log --oneline` and verify:
   - the first Step 4 commit is the planning-doc commit for approved Step 1-3 docs
   - commit count is not lower than `1 + number_of_stages`
4. Confirm the Contract: normal UI/CLI flow, end-to-end outcome, and required recovery—not direct-only behavior. For documentation-only work, confirm the intended document outcome, evidence boundary, and allowed file scope instead.
5. Verify scoped deployment, release, external-system, role, migration, and other dependencies in the applicable environment when they are within the approved scope; otherwise record them as not applicable in the Step 4 summary.
6. Confirm documentation is updated, including the finalized Step 4 implementation summary.

## Next
Notify the user for review/handoff. If additional scope emerges, return to the appropriate earlier step instead of improvising within Step 4.
