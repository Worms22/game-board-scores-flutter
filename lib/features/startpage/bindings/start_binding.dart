import 'package:crow/crow.dart';
import 'package:game_board_scores/features/startpage/presentation/view_models/start_view_model.dart';
import 'package:get/get.dart';


class StartBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut(StartViewModel.new);
  }
}
