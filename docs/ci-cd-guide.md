# CI/CD Guide

## Workflow

File: `.github/workflows/android-e2e.yml`

Pipeline behavior:

- Triggers on push to `main` and on pull requests
- Sets up Java 17 and Flutter stable
- Installs dependencies
- Installs Patrol CLI
- Runs `patrol doctor`
- Boots Android emulator API 34
- Runs Patrol smoke tests
- Uploads APK and test/report artifacts

## Why Emulator in CI

- Real devices are ideal for local confidence and debugging.
- Cloud CI has more deterministic access to emulators.
- Emulator smoke runs catch regressions quickly before merge.

## Suggested CI Expansion

- Add matrix for multiple API levels
- Run auth suite in nightly builds
- Publish test reports to a dashboard (e.g. Allure, custom parser)
- Gate merge on Patrol smoke pass
