import 'package:crow/crow.dart';

abstract class LoginRepository extends Repository {
  Future<dynamic> login(String email, String password);
}
