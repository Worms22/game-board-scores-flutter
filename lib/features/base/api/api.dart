import 'package:flutter_environment/flutter_environment.dart';

/// The responsible of holding every single entry point.
class Api {
  const Api._();

  static final String baseUrl = Environment.instance.values.baseUrl;

  static final String usersUrl = '$baseUrl/users';
}
