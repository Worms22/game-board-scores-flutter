import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

abstract class LoginRemoteDataSource extends RemoteDataSource {
  Future<bool> login(String username, String password);
}
