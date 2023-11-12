import 'package:game_board_scores/features/signup/data/data_sources/signup_data_source.dart';
import 'package:game_board_scores/features/signup/domain/signup_repository.dart';

class SignupRepositoryImpl extends SignupRepository {
  SignupRepositoryImpl(this._remoteDataSource);

  final SignupDataSource _remoteDataSource;

  @override
  Future<bool> signup(String email, String password) {
    return _remoteDataSource.signup(email, password);
  }
}
