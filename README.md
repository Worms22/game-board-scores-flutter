
Run the following commands in order:

```bash
flutter pub get
flutter packages pub run build_runner watch # or
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n # generate localization files in the .dart_tool
```

### running
```bash
flutter run --dart-define=ENV=DEV
flutter run --dart-define=ENV=ALPHA
flutter run --dart-define=ENV=BETA
flutter run --dart-define=ENV=PROD
```