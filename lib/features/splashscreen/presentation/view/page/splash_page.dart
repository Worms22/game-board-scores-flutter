import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/splashscreen/binding/splash_binding.dart';

import 'package:game_board_scores/features/splashscreen/presentation/view/screen/splash_screen.dart';

class SplashPage extends Page<dynamic> {
  SplashPage()
      : super(
          name: Routes.splash,
          view: SplashScreen.new,
          binding: SplashBinding(),
        );
}
