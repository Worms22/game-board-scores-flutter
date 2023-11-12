import 'package:crow/crow.dart';

abstract class LoginRemoteDataSource extends RemoteDataSource {
  Future<bool> login(String username, String password);
}
