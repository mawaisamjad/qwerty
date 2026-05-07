# Flutter Patrol Demo

Production-ready Flutter app with authentication flows and Patrol E2E coverage for
real Android device testing plus GitHub Actions CI.

## Features

- Sign up flow with validation and success handling
- Sign in flow with loading/error handling
- Home screen with welcome message and logout
- Patrol E2E suites for auth, navigation, and UI verification
- Real device execution guide (USB debugging + ADB)
- GitHub Actions Android E2E workflow

## Tech Stack

- Flutter (stable), Dart, Material 3
- Patrol + integration_test
- GitHub Actions for CI/CD
- Feature-based clean structure

## Project Structure

```text
lib/
 ├── core/
 │   ├── constants/
 │   └── utils/
 ├── features/
 │   ├── auth/
 │   │   ├── data/
 │   │   ├── domain/
 │   │   └── presentation/
 │   └── home/
 ├── app.dart
 └── main.dart

integration_test/
 ├── auth/
 │   ├── login_test.dart
 │   ├── logout_test.dart
 │   └── signup_test.dart
 ├── smoke/
 │   └── app_launch_test.dart
 └── patrol.dart
```

## Quick Start

```bash
flutter pub get
flutter test
flutter run
```

Run Patrol on a connected real device:

```bash
dart pub global activate patrol_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
patrol doctor
patrol test -d <device-id>
```

## Documentation

- [Setup Guide](docs/setup-guide.md)
- [Testing Guide](docs/testing-guide.md)
- [CI/CD Guide](docs/ci-cd-guide.md)
- [Troubleshooting Guide](docs/troubleshooting-guide.md)

## Notes About Patrol Versions

This project uses `patrol` 4.x and `patrol_cli` 4.x (compatible pair).
In newer Patrol versions, `patrol init` is no longer part of the CLI workflow;
use `patrol doctor`, `patrol test`, and related commands instead.
