import 'package:flutter_structure/features/base/token/domain/entity/token_entity.dart';

abstract class TokenLocalDataSource {
  Future<void> saveToken(TokenEntity token);

  Future<TokenEntity?> getToken();

  Future<void> deleteToken();
}
