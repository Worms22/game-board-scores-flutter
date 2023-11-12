import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/signup/bindings/signup_binding.dart';
import 'package:game_board_scores/features/signup/presentation/view/screens/signup_screen.dart';

class SignupPage extends Page<dynamic> {
  SignupPage()
      : super(
    name: Routes.registration,
    view: SignupScreen.new,
    binding: SignupBinding(),
  );
}
