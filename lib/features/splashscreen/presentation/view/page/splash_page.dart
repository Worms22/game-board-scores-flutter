import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/splashscreen/binding/splash_binding.dart';

import 'package:flutter_structure/features/splashscreen/presentation/view/screen/splash_screen.dart';

class SplashPage extends Page<dynamic> {
  SplashPage()
      : super(
          name: Routes.splash,
          view: SplashScreen.new,
          binding: SplashBinding(),
        );
}
