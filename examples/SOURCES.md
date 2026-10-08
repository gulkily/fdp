# Example Source Evidence

These public case studies summarize completed FDP cycles from [gulkily/v3](https://github.com/gulkily/v3). They retain material decisions, verification results, limitations, and recovery behavior; they do not reproduce private local paths, credentials, or environment-specific URLs.

## Private Window Lobby Fallback

- Artifacts: [Step 1](https://github.com/gulkily/v3/blob/main/docs/plans/private_window_lobby_fallback/private_window_lobby_fallback_step1_solution_assessment.md) · [Step 2](https://github.com/gulkily/v3/blob/main/docs/plans/private_window_lobby_fallback/private_window_lobby_fallback_step2_feature_description.md) · [Step 3](https://github.com/gulkily/v3/blob/main/docs/plans/private_window_lobby_fallback/private_window_lobby_fallback_step3_development_plan.md) · [Step 4](https://github.com/gulkily/v3/blob/main/docs/plans/private_window_lobby_fallback/private_window_lobby_fallback_step4_implementation_summary.md)
- Implementation evidence: [planning](https://github.com/gulkily/v3/commit/dc0c4395b586b487ec61d77b1bac38db08d893cf) · [Stage 1](https://github.com/gulkily/v3/commit/e07c5fd3e2dd4692e60bff25436c2762bbf6290d) · [Stage 2](https://github.com/gulkily/v3/commit/e0455270c38236c9e3a0c0298548b29bedef8170)
- Public-summary boundary: retain the missing-key, safe-return, visible-authentication-failure, and Lobby-only access behavior; omit environment-specific route examples beyond the artifact record.

## v3 Status Command

- Artifacts: [Step 1](https://github.com/gulkily/v3/blob/main/docs/plans/v3_status_command/v3_status_command_step1_solution_assessment.md) · [Step 2](https://github.com/gulkily/v3/blob/main/docs/plans/v3_status_command/v3_status_command_step2_feature_description.md) · [Step 3](https://github.com/gulkily/v3/blob/main/docs/plans/v3_status_command/v3_status_command_step3_development_plan.md) · [Step 4](https://github.com/gulkily/v3/blob/main/docs/plans/v3_status_command/v3_status_command_step4_implementation_summary.md)
- Implementation evidence: [Stage 1](https://github.com/gulkily/v3/commit/bf963db73c2ecff1f387a27236b6270047bafd09) · [Stage 2](https://github.com/gulkily/v3/commit/0174e067789b7bda05b4fb7b0f2b15aa3e1805a6) · [Stage 3](https://github.com/gulkily/v3/commit/64f3d9cb3ade9a6cb239b900b2da7c380c73c33f)
- Public-summary boundary: retain the read-only contract and the limitation that a held lock does not prove a manual rebuild; omit local paths and unrelated operational state.

## Offline Reading Health Check

- Artifacts: [Step 1](https://github.com/gulkily/v3/blob/main/docs/plans/offline_reading_health_check/offline_reading_health_check_step1_solution_assessment.md) · [Step 2](https://github.com/gulkily/v3/blob/main/docs/plans/offline_reading_health_check/offline_reading_health_check_step2_feature_description.md) · [Step 3](https://github.com/gulkily/v3/blob/main/docs/plans/offline_reading_health_check/offline_reading_health_check_step3_development_plan.md) · [Step 4](https://github.com/gulkily/v3/blob/main/docs/plans/offline_reading_health_check/offline_reading_health_check_step4_implementation_summary.md)
- Implementation evidence: [Stage 1](https://github.com/gulkily/v3/commit/26d615b4ca02d60127d8b58c71dc3ce96fdbaefb) · [Stage 2](https://github.com/gulkily/v3/commit/126d11b895f4e6c9f187fa3bc7202ae0f7753ce3) · [Stage 3](https://github.com/gulkily/v3/commit/707f892e4042bc2d1983ce7191cc49c0db81265b) · [Stage 4](https://github.com/gulkily/v3/commit/0a6e143c7fb442db92e8881a7ab4556eaefa9a12) · [Stage 5](https://github.com/gulkily/v3/commit/02b6d4f34cc65451c4fb24c703d60c87cf087bf0)
- Public-summary boundary: retain the public-data boundary, recovery sequence, and known unrelated test failures; omit deployment-specific configuration and browser-profile details.
