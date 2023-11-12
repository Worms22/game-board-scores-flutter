import 'package:crow/crow.dart';

abstract class SignupRepository extends Repository {
  Future<bool> signup(String email, String password);
}
