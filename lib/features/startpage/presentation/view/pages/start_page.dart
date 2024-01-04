import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/startpage/bindings/start_binding.dart';
import 'package:game_board_scores/features/startpage/presentation/view/screens/start_screen.dart';

class StartPage extends Page<dynamic> {
  StartPage()
      : super(
    name: Routes.start,
    page: StartScreen.new,
    binding: StartBinding(),
  );
}
