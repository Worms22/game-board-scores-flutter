import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

class TokenEntity extends Entity {
  TokenEntity(
    this.value,
    this.refreshToken,
    this.type,
    this.createdAt,
    this.expiration,
  );

  String value;
  String refreshToken;
  TokenType type;
  DateTime createdAt;
  int expiration;
}

enum TokenType {
  bearer;

  static TokenType parse(String source) {
    assert(
      source == 'bearer',
      'The passed value "$source"'
      ' must be one of the following'
      ' ${TokenType.values.map((TokenType e) => e.name)} values.',
    );
    late TokenType type;
    switch (source) {
      case 'bearer':
        type = TokenType.bearer;
    }
    return type;
  }
}
