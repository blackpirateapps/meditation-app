# Cupertino Meditation App - AI Handoff

This directory contains the codebase for a Cupertino-themed meditation application built with Flutter.
Please read this carefully before executing any new code changes.

## Core Directives & Constraints

1. **Cupertino Exclusive Design**
   - The application strictly uses `package:flutter/cupertino.dart`.
   - The `pubspec.yaml` has `uses-material-design: false` explicitly set.
   - Do **NOT** introduce `package:flutter/material.dart` components (e.g. `Scaffold`, `AppBar`, `ElevatedButton`).
   - All routing, navigation, and dialogs must use their Cupertino equivalents (e.g., `CupertinoPageScaffold`, `showCupertinoDialog`).

2. **Data Storage Mechanism**
   - Local persistence is currently handled by `shared_preferences`. The logic is encapsulated within `/lib/services/storage_service.dart`.
   - Modifying this storage mechanism isn't necessary unless complex relational structures are required.

3. **CI/CD Build Pipeline**
   - We do not track the generated `android/`, `ios/`, `linux/`, `macos/`, `web/`, or `windows/` platform directories in version control by default.
   - The `.github/workflows/build-apk.yml` handles generating these directories dynamically via `flutter create .` before building the APK artifact.

## Directory Structure

- `lib/main.dart` - Application entry point and Tab scaffolding setup.
- `lib/screens/`
  - `home_screen.dart` - Allows users to pick meditation times using a `CupertinoPicker`.
  - `meditation_screen.dart` - The timer view with start/pause logic and saving stats on completion.
  - `stats_screen.dart` - Displays local statistics fetching from `StorageService`.
- `lib/services/`
  - `storage_service.dart` - Wrapper around `SharedPreferences`.

## Ongoing Development Ideas
- Implement historical records (list of completed dates).
- Improve the timer UI with a progress ring / animation.
- Add background audio or haptics during the meditation state.
