import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/select_players/presentation/view/screens/select_players_screen.dart';
import 'package:game_board_scores/features/home/bindings/home_bindings.dart';
import 'package:game_board_scores/features/home/presentation/view/screens/home_screen.dart';


class SelectPlayersPage extends Page<dynamic> {
  SelectPlayersPage()
      : super(
    name: Routes.selectPlayers,
    view: SelectPlayersScreen.new,
  );
}
