import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/home/bindings/home_bindings.dart';
import 'package:game_board_scores/features/home/presentation/view/screens/home_screen.dart';
import 'package:game_board_scores/features/home/presentation/view/screens/select_player_screen.dart';


class SelectPlayerPage extends Page<dynamic> {
  SelectPlayerPage()
      : super(
    name: Routes.selectPlayers,
    page: SelectPlayersScreen.new,
    binding: HomeBinding(),
  );
}
