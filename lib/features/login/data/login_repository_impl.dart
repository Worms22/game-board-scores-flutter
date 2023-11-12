

import 'package:game_board_scores/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:game_board_scores/features/login/domain/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this._remoteDataSource);

  final LoginRemoteDataSource _remoteDataSource;

  @override
  Future<bool> login(String email, String password) {
    return _remoteDataSource.login(email, password);
  }
}
