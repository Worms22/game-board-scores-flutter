import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/profile/bindings/profile_bindings.dart';
import 'package:game_board_scores/features/profile/presentation/view/screens/change_password_screen.dart';

class ChangePasswordPage extends Page<dynamic> {
  ChangePasswordPage()
      : super(
          view: ChangePasswordScreen.new,
          binding: ProfileBinding(),
          name: Routes.changePassword,
        );
}
