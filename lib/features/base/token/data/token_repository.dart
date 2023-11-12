import 'package:flutter_structure/features/base/token/domain/entity/token_entity.dart';
import 'package:flutter_structure/features/base/token/domain/token_local_data_source.dart';
import 'package:flutter_structure/features/base/token/domain/token_repository.dart';

class TokenRepositoryImpl extends TokenRepository {
  TokenRepositoryImpl(this._tokenLocalDataSource);

  final TokenLocalDataSource _tokenLocalDataSource;

  @override
  Future<void> saveToken(TokenEntity token) {
    return _tokenLocalDataSource.saveToken(token);
  }

  @override
  Future<TokenEntity?> getToken() {
    return _tokenLocalDataSource.getToken();
  }

  @override
  Future<void> deleteToken() {
    return _tokenLocalDataSource.deleteToken();
  }
}
