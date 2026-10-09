# Private Window Lobby Fallback Comparison

This comparison shows what the recorded FDP cycle required reviewers to make explicit. It is not a model benchmark: no historical unguided session was preserved, and a direct response could still make good choices. The difference is the reviewable evidence the process requires before and during implementation.

## Direct Baseline Prompt

Use this exact prompt in a clean assistant session for a reproducible comparison:

> On an approved-members-only instance, a visitor without a saved browser key reaches a Reconnecting page from a protected URL instead of automatically entering the Lobby. Fix this feature.

Ask the assistant to propose and implement the fix in one pass. Record its response, changed files, tests, and commits before scoring it.

## Review Scorecard

| Decision or evidence | Direct prompt alone requires it? | What the recorded FDP cycle established |
| --- | --- | --- |
| Select among viable approaches | No; an assistant may choose an approach without recording alternatives. | Step 1 compared a missing-key-only redirect, a server-wide redirect, and a new entry route; it selected the narrow redirect. |
| Preserve approved-member recovery | No; the prompt names the broken keyless path, not the saved-key behavior. | Step 2 required a usable saved key to retain its existing authentication and return flow. |
| Distinguish absence from failure | No; an implementation can conflate missing keys with malformed keys, authentication failures, or network failures. | Step 2 required only an absent usable key to enter Lobby; other failures remain visible. |
| Retain the access boundary | No; the direct request does not state whether a new anonymous route is acceptable. | Steps 1–2 retained Lobby as the sole anonymous and pending-access destination. |
| Sequence and verify the work | No; tests and commit boundaries are optional unless requested. | Step 3 separated the behavior change from regression coverage; Step 4 recorded two stage commits and a focused eight-test result. |

## Recorded Result

The FDP cycle delivered a missing-key-only Lobby fallback, preserved safe return for approved members, retained visible errors for failed authentication, and recorded focused verification. Its [artifact trail](./private-window-lobby-fallback-artifact-trail.md) provides the plans and commits behind each claim.

## Recorded Baseline Run

On October 9, 2026, a clean Codex CLI session using `gpt-5.6-terra` ran the direct baseline prompt against v3 revision `edcd81e118db24154c05c0dacb4523fb6e460ccc`, immediately before the documented feature-planning commit. It worked in an isolated temporary worktree.

- Changed files: `public/assets/private_site_auth.js`, `src/ForumRewrite/Application.php`, `templates/pages/authentication_resume.php`, `tests/LocalAppSmokeTest.php`, and `tests/PrivateSiteAuthTest.php`.
- Verification: `php tests/run.php PrivateSiteAuthTest LocalAppSmokeTest` reported **120 run, 117 passed, 3 failed**. The failures were `testAnonymousPublicBoardDoesNotStartViewerSession`, `testPostAndActivityLinkAdjacentSignatureFiles`, and `testSqliteViewerRouteUsesToolsShellAndPublishedSource`.
- Decision: the baseline added a server-side redirect for a protected request with no identity hint, plus a client-side missing-key redirect to Lobby.

### Score

| Scorecard row | Result | Evidence |
| --- | --- | --- |
| Compare viable approaches | Not demonstrated | The baseline response selected an implementation directly and recorded no alternatives. |
| Preserve saved-key recovery | Failed | The server redirects when no identity hint exists, but a browser-held saved key is not visible to the server. The recorded FDP Step 1 rejected this class of server-side distinction. |
| Keep authentication failures visible | Passed | The focused run included the existing `testAuthenticationFailureIsVisible`, which passed; the new redirect is limited to the missing-key branch. |
| Retain Lobby as the access boundary | Passed | The baseline reused the existing Lobby route rather than adding another entry surface. |
| Stage and verify delivery | Partial | It added tests, but did not create a reviewed decision record or stage-scoped commits; the focused run also finished with three failures. |

This is one run of one model, not a claim about all unguided assistants. It shows a concrete way FDP changed this feature's work: the source cycle made the saved-key recovery boundary explicit before code, while the direct run chose the server-side shortcut that violates it.

## How to Interpret a Baseline Run

A baseline is comparable only when it starts from the direct prompt above and is evaluated against the scorecard before adding follow-up requirements. Do not claim that FDP prevents mistakes or that an unguided assistant necessarily fails. Report which scorecard rows the baseline covered, what evidence it produced, and any later correction needed to reach the recorded FDP outcome.
