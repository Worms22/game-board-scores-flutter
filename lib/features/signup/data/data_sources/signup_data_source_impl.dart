import 'dart:convert';
import 'package:flutter_structure/features/base/utils/constants.dart';
import 'package:flutter_structure/features/signup/data/data_sources/signup_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupDataSourceImpl extends SignupDataSource {
  @override
  Future<bool> signup(String email, String password) async {
    bool result = false;
    final Map<String, String> body = <String, String>{
      'grant_type': 'password',
      'email': email,
      'password': password,
    };

    await http
        .post(
      Uri.parse('$baseUrl/signup'),
      body: body,
    )
        .then((http.Response response) async {
      final int statusCode = response.statusCode;
      if (statusCode == 200) {
        final data = json.decode(response.body);
        final String token = data['jwt_token'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
        await prefs.setString('email', email);
        result = true;
      }
    });

    return result;
  }
}
