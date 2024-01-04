import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/home/presentation/view/pages/home_page.dart';
import 'package:game_board_scores/features/home/presentation/view/pages/select_player_page.dart';
import 'package:game_board_scores/features/login/presentation/view/pages/login_page.dart';
import 'package:game_board_scores/features/main_structure/presentation/page/main_page.dart';
import 'package:game_board_scores/features/profile/presentation/view/pages/change_password_page.dart';
import 'package:game_board_scores/features/profile/presentation/view/pages/profile_page.dart';
import 'package:game_board_scores/features/saved/presentation/view/pages/saved_page.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/pages/seven_wonders_page.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/pages/seven_wonders_players_page.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/pages/seven_wonders_totals_page.dart';
import 'package:game_board_scores/features/signup/presentation/view/pages/signup_page.dart';
import 'package:game_board_scores/features/signup/presentation/view/pages/signup_page_step2.dart';
import 'package:game_board_scores/features/splashscreen/presentation/view/page/splash_page.dart';
import 'package:game_board_scores/features/startpage/presentation/view/pages/start_page.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/pages/sushi_page.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/pages/sushi_players_page.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/pages/sushi_totals_page.dart';

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
      ChangePasswordPage(),
      SelectPlayerPage(),
      SushiGoPage(),
      SushiGoPlayersPage(),
      SushiGoTotalPage(),
      SevenWondersPage(),
      SevenWondersPlayersPage(),
      SevenWondersTotalPage(),
    ];
  }
}
