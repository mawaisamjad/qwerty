# Setup Guide

## 1) Install Flutter Tooling

- Install Flutter stable from [flutter.dev](https://docs.flutter.dev/get-started/install).
- Install Android Studio (latest stable) with:
  - Android SDK
  - Android SDK Command-line Tools
  - Platform tools (`adb`)
- Verify setup:

```bash
flutter doctor -v
```

## 2) Clone and Boot the Project

```bash
git clone <your-repository-url>
cd flutter_patrol_demo
flutter pub get
```

## 3) Install Patrol CLI

```bash
dart pub global activate patrol_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

Verify:

```bash
patrol --version
patrol doctor
```

## 4) Configure Real Android Device

### Enable Developer Mode

- Open **Settings > About Phone**
- Tap **Build Number** 7 times

### Enable Debugging

- Open **Settings > Developer Options**
- Enable:
  - USB Debugging
  - Install via USB (if available on your device)

### Connect and Verify Device

```bash
adb devices
flutter devices
```

Expected output includes your physical device (for example `android-arm64`).

## 5) Run the App

```bash
flutter run -d <device-id>
```
