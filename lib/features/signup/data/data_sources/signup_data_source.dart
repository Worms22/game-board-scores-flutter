import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

abstract class SignupDataSource extends RemoteDataSource {
  Future<bool> signup(String email, String password);
}
