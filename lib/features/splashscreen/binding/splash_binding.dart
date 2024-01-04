import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/splashscreen/presentation/view_model/splash_view_model.dart';
import 'package:get/get.dart';


class SplashBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut(SplashViewModel.new);
  }
}
