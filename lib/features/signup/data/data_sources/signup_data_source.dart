import 'package:crow/crow.dart';

abstract class SignupDataSource extends RemoteDataSource {
  Future<bool> signup(String email, String password);
}
