import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

abstract class SignupRepository extends Repository {
  Future<bool> signup(String email, String password);
}
