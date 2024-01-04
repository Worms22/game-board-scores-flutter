import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/signup/bindings/signup_binding.dart';
import 'package:game_board_scores/features/signup/presentation/view/screens/signup_screen.dart';

class SignupPage extends Page<dynamic> {
  SignupPage()
      : super(
    name: Routes.registration,
    page: SignupScreen.new,
    binding: SignupBinding(),
  );
}
