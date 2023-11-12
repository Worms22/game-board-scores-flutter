import 'package:json_annotation/json_annotation.dart';

/// Converting between [String] and [DateTime].
///
/// If the String source is null, than the default value is DateTime.now()
class DateTimeConverter implements JsonConverter<DateTime, String?> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String? json) {
    if (json == null) return DateTime.now();
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime json) => json.toIso8601String();
}
