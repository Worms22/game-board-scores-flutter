import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/login/bindings/login_binding.dart';
import 'package:flutter_structure/features/login/presentation/view/screens/login_screen.dart';

class LoginPage extends Page<dynamic> {
  LoginPage()
      : super(
    name: Routes.login,
    view: LoginScreen.new,
    binding: LoginBinding(),
  );
}
