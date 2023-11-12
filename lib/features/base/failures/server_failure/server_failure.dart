import 'package:json_annotation/json_annotation.dart';

part 'server_failure.g.dart';

@JsonSerializable()
class ServerFailure {
  ServerFailure(this.code, this.message);

  factory ServerFailure.fromJson(Map<String, dynamic> json) =>
      _$ServerFailureFromJson(json);

  @JsonKey(name: 'error')
  final String code;

  @JsonKey(name: 'error_description')
  final String message;
}
