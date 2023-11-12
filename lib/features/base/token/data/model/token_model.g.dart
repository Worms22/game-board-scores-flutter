// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      json['access_token'] as String,
      json['refresh_token'] as String,
      $enumDecode(_$TokenTypeEnumMap, json['token_type']),
      const DateTimeConverter().fromJson(json['createdAt'] as String?),
      json['expires_in'] as int,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.value,
      'refresh_token': instance.refreshToken,
      'token_type': _$TokenTypeEnumMap[instance.type]!,
      'expires_in': instance.expiration,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };

const _$TokenTypeEnumMap = {
  TokenType.bearer: 'bearer',
};
