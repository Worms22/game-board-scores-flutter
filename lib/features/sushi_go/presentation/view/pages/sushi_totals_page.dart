import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/startpage/bindings/start_binding.dart';
import 'package:game_board_scores/features/startpage/presentation/view/screens/start_screen.dart';
import 'package:game_board_scores/features/sushi_go/bindings/sushi_go_bindings.dart';

import 'package:game_board_scores/features/sushi_go/presentation/view/screens/sushi_go_screen_phases.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/screens/sushi_go_totals_screen.dart';

class SushiGoTotalPage extends Page<dynamic> {
  SushiGoTotalPage()
      : super(
    name: Routes.sushiGoTotals,
    view: SushiGoTotalsScreen.new,
    binding: SushiGoBinding(),
  );
}
