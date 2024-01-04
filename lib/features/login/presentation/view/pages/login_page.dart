import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/login/bindings/login_binding.dart';
import 'package:game_board_scores/features/login/presentation/view/screens/login_screen.dart';

class LoginPage extends Page<dynamic> {
  LoginPage()
      : super(
    name: Routes.login,
    page: LoginScreen.new,
    binding: LoginBinding(),
  );
}
