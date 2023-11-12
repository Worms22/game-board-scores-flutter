import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/home/presentation/view/pages/home_page.dart';
import 'package:flutter_structure/features/login/presentation/view/pages/login_page.dart';
import 'package:flutter_structure/features/main_structure/presentation/page/main_page.dart';
import 'package:flutter_structure/features/profile/presentation/view/pages/change_password_page.dart';
import 'package:flutter_structure/features/profile/presentation/view/pages/profile_page.dart';
import 'package:flutter_structure/features/saved/presentation/view/pages/saved_page.dart';
import 'package:flutter_structure/features/signup/presentation/view/pages/signup_page.dart';
import 'package:flutter_structure/features/signup/presentation/view/pages/signup_page_step2.dart';
import 'package:flutter_structure/features/splashscreen/presentation/view/page/splash_page.dart';
import 'package:flutter_structure/features/startpage/presentation/view/pages/start_page.dart';

abstract class AppRouter {
  static const String initial = Routes.splash;

  static List<Page<dynamic>> get pages => _getPages();

  static List<Page<dynamic>> _getPages() {
    return <Page<dynamic>>[
      SplashPage(),
      StartPage(),
      LoginPage(),
      SignupPage(),
      SignupPageStep2(),
      MainPage(),
      HomePage(),
      SavedPage(),
      ProfilePage(),
      ChangePasswordPage()
    ];
  }
}
