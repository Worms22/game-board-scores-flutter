import 'package:game_board_scores/features/base/token/domain/entity/token_entity.dart';

abstract class TokenLocalDataSource {
  Future<void> saveToken(TokenEntity token);

  Future<TokenEntity?> getToken();

  Future<void> deleteToken();
}
