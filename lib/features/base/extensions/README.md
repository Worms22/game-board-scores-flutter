## Extensions

The place in which goose every extension methods, there is no way to have one of theme outside of
this package.

### Name conventions

The recommended name for a non-nullable extension is the {extendedType}Extension e.g:

```dart
extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
}
```

For the nullable ones is Nullable{extendedType}Extension e.g:

```dart
extension NullableStringExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
```