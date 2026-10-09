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

## How to Interpret a Baseline Run

A baseline is comparable only when it starts from the direct prompt above and is evaluated against the scorecard before adding follow-up requirements. Do not claim that FDP prevents mistakes or that an unguided assistant necessarily fails. Report which scorecard rows the baseline covered, what evidence it produced, and any later correction needed to reach the recorded FDP outcome.
