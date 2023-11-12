import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/token/domain/entity/token_entity.dart';
import 'package:flutter_structure/features/base/utils/json/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
@DateTimeConverter()
class TokenModel extends Model<TokenEntity> {
  TokenModel(
    this.value,
    this.refreshToken,
    this.type,
    this.createdAt,
    this.expiration,
  );

  factory TokenModel.fromEntity(TokenEntity entity) {
    return TokenModel(
      entity.value,
      entity.refreshToken,
      entity.type,
      entity.createdAt,
      entity.expiration,
    );
  }

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  @JsonKey(name: 'access_token')
  String value;
  @JsonKey(name: 'refresh_token')
  String refreshToken;
  @JsonKey(name: 'token_type')
  TokenType type;
  @JsonKey(name: 'expires_in')
  int expiration;
  DateTime createdAt;

  @override
  TokenEntity toEntity() => TokenEntity(
        value,
        refreshToken,
        type,
        createdAt,
        expiration,
      );

  @override
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
