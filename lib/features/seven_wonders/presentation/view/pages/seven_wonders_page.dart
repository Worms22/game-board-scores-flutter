import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/seven_wonders/bindings/seven_wonders_bindings.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/screens/seven_wonders_screen_phases.dart';

class SevenWondersPage extends Page<dynamic> {
  SevenWondersPage()
      : super(
    name: Routes.sushiGo,
    view: SevenWondersScreenPhases.new,
    binding: SevenWondersBinding(),
  );
}
