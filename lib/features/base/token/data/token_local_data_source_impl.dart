import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_structure/features/base/token/data/model/token_model.dart';
import 'package:flutter_structure/features/base/token/domain/entity/token_entity.dart';
import 'package:flutter_structure/features/base/token/domain/token_local_data_source.dart';

class TokenLocalDataSourceImpl extends TokenLocalDataSource {
  FlutterSecureStorage get _secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );

  @override
  Future<void> saveToken(TokenEntity token) {
    final Map<String, dynamic> tokenMap = TokenModel.fromEntity(token).toJson();
    return _secureStorage.write(key: 'token', value: jsonEncode(tokenMap));
  }

  @override
  Future<TokenEntity?> getToken() async {
    final String? tokenMap = await _secureStorage.read(key: 'token');
    if (tokenMap == null) return null;
    return TokenModel.fromJson(jsonDecode(tokenMap)).toEntity();
  }

  @override
  Future<void> deleteToken() {
    return _secureStorage.delete(key: 'token');
  }
}
