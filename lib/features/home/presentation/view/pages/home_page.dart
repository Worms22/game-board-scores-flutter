import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/home/bindings/home_bindings.dart';
import 'package:game_board_scores/features/home/presentation/view/screens/home_screen.dart';


class HomePage extends Page<dynamic> {
  HomePage()
      : super(
    name: Routes.home,
    page: HomeScreen.new,
    binding: HomeBinding(),
  );
}
