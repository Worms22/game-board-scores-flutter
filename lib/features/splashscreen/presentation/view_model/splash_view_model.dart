import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends ViewModel with StateMixin<dynamic> {
  SplashViewModel();

  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? accessToken = prefs.getString('jwt_token');

    if (accessToken != null && accessToken.isNotEmpty) {
      await navigateToMainScreen();
    } else {
      await navigateToMainScreen();

     // await navigateToStartPage();
    }
  }

  Future<void> navigateToMainScreen() async {
    FlutterNativeSplash.remove();
    await Future<void>.delayed(const Duration(seconds: 2));
    await Get.offAndToNamed(Routes.mainPage);
  }

  Future<void> navigateToStartPage() async {
    FlutterNativeSplash.remove();
    await Future<void>.delayed(const Duration(seconds: 2));
    await Get.toNamed(Routes.start);
  }
}
