import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/main_structure/binding/main_structure_binding.dart';
import 'package:game_board_scores/features/main_structure/main_screen.dart';



class MainPage extends Page<dynamic> {
  MainPage()
      : super(
    name: Routes.mainPage,
    view: MainScreen.new,
    binding: MainStructureBinding(),
  );
}
