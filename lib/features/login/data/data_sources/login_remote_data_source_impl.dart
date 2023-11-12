import 'dart:convert';
import 'package:flutter_structure/features/base/utils/constants.dart';
import 'package:flutter_structure/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:flutter_structure/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<bool> login(String email, String password) async {

    bool result = false;
    final Map<String, String> body = <String, String>{
      'grant_type': 'password',
      'email': email,
      'password': password,
    };


    // if you use normal http use this

    await http
        .post(
      Uri.parse('$baseUrl/login'),
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
