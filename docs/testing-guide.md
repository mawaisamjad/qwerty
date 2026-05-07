# Testing Guide

## Test Suites

This project includes:

- `test/widget_test.dart` for widget smoke checks
- `integration_test/smoke/app_launch_test.dart` for app launch smoke
- `integration_test/auth/signup_test.dart` for successful sign-up and validation errors
- `integration_test/auth/login_test.dart` for successful and invalid login
- `integration_test/auth/logout_test.dart` for logout flow and keyboard/native back interaction

## Run Unit/Widget Tests

```bash
flutter test
```

## Run Patrol Tests on Real Android Device

1. Connect the physical device over USB.
2. Verify that `adb devices` and `flutter devices` list it.
3. Run:

```bash
patrol test -d <device-id>
```

Target a single suite:

```bash
patrol test --target integration_test/auth/login_test.dart -d <device-id>
```

## Debugging Patrol Failures

- Run with verbose logs:

```bash
patrol test -v -d <device-id>
```

- If tests fail due to stale app state, rerun with uninstall behavior enabled
  (enabled by default).
- Validate the current focused screen by checking visible labels and keyed widgets.
- Prefer executing one test target at a time during local debugging.
