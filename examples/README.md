# FDP Examples

These are completed feature cycles from [v3](https://github.com/gulkily/v3), retold as concise, auditable examples of FDP in use. Start with the featured case; each page links to the original Step 1–4 artifacts and implementation commits.

## Featured Case

### [Private Window Lobby Fallback](./private-window-lobby-fallback.md)

A private-window visitor without a saved browser key reached an error instead of the one permitted entry surface. The cycle chose a narrow recovery redirect, protected authentication failures from being mistaken for missing keys, and delivered it in two verified stages.

Follow its [artifact trail](./private-window-lobby-fallback-artifact-trail.md) for a reproducible prompt sequence, planning artifacts, and stage commits.

The accompanying [direct-prompt comparison](./private-window-lobby-fallback-comparison.md) makes the review controls visible without claiming an unmeasured model benchmark.

| Step | What the feature cycle established |
| --- | --- |
| 1 — Decide | Redirect only a genuinely keyless visitor to Lobby; reject redirects that weaken saved-key recovery or duplicate the entry surface. |
| 2 — Define | Preserve the safe requested destination, keep Lobby-only access, and leave malformed-key and authentication failures visible. |
| 3 — Plan | Ship the behavior first, then cover keyless entry and approved-member recovery. |
| 4 — Verify | A browser-context smoke check and eight focused tests confirmed the outcome. |

## Evidence

The complete source-artifact and commit record for this and the forthcoming deeper examples is in [Source Evidence](./SOURCES.md).

## More Examples

### [v3 Status Command](./v3-status-command.md)

A medium-complexity operational feature: it centralizes a read-only status view by reusing existing health semantics, while making its manual-rebuild limitation explicit.

### [Offline Reading Health Check](./offline-reading-health-check.md)

A deep-dive user-facing feature: it separates readiness diagnostics from offline reading, preserves a public-data boundary, and verifies recovery from preparation through disconnection.
