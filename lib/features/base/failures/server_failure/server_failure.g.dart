// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerFailure _$ServerFailureFromJson(Map<String, dynamic> json) =>
    ServerFailure(
      json['error'] as String,
      json['error_description'] as String,
    );

Map<String, dynamic> _$ServerFailureToJson(ServerFailure instance) =>
    <String, dynamic>{
      'error': instance.code,
      'error_description': instance.message,
    };
