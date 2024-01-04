import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/seven_wonders/bindings/seven_wonders_bindings.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/screens/seven_wonders_players_screen.dart';

class SevenWondersPlayersPage extends Page<dynamic> {
  SevenWondersPlayersPage()
      : super(
    name: Routes.sevenWondersPlayers,
    page: SevenWondersPlayersScreen.new,
    binding: SevenWondersBinding(),
  );
}
