import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/seven_wonders/bindings/seven_wonders_bindings.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/screens/seven_wonders_players_screen.dart';

class SevenWondersPlayersPage extends Page<dynamic> {
  SevenWondersPlayersPage()
      : super(
    name: Routes.sushiGoPlayers,
    view: SevenWondersPlayersScreen.new,
    binding: SevenWondersBinding(),
  );
}
