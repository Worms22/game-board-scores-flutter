import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/token/domain/entity/token_entity.dart';

abstract class TokenRepository extends Repository {
  Future<void> saveToken(TokenEntity token);

  Future<TokenEntity?> getToken();

  Future<void> deleteToken();
}
