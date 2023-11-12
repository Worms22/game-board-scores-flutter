import 'package:crow/crow.dart';
import 'package:game_board_scores/features/splashscreen/presentation/view_model/splash_view_model.dart';
import 'package:get/get.dart';


class SplashBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut(SplashViewModel.new);
  }
}
