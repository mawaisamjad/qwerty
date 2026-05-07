# Troubleshooting Guide

## Device Not Detected

- Check USB cable supports data transfer (not charge-only).
- Re-enable USB Debugging.
- Reconnect device and accept RSA fingerprint prompt.
- Run:

```bash
adb kill-server
adb start-server
adb devices
```

## `adb` Not Found

- Ensure Android SDK platform tools are installed.
- Add platform-tools to `PATH`:

```bash
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
```

## Patrol Command Not Found

- Add pub cache binaries to `PATH`:

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

- Re-open shell and verify:

```bash
patrol --version
```

## Patrol Build Failures

- Run `flutter clean && flutter pub get`.
- Ensure `patrol` package and `patrol_cli` major versions are compatible.
- Run `patrol doctor` to verify dependencies.
- Confirm Java 17 and Android SDK are installed.

## USB Debugging / Permissions Issues

- Toggle USB Debugging off/on.
- Remove old USB authorization and re-authorize host machine.
- Keep device unlocked while starting tests.
- For permission popups during test, either:
  - grant manually once before running suite, or
  - handle in tests through Patrol native APIs where applicable.

## App Lifecycle / Flaky Navigation in E2E

- Add `await $.pumpAndSettle()` after major UI transitions.
- Keep each test independent (no shared mutable app state).
- Use deterministic test data and avoid random timing assumptions.
