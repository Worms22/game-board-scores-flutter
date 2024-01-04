import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

abstract class LoginRepository extends Repository {
  Future<dynamic> login(String email, String password);
}
