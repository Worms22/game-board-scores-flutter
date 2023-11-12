import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/startpage/bindings/start_binding.dart';
import 'package:game_board_scores/features/startpage/presentation/view/screens/start_screen.dart';
import 'package:game_board_scores/features/sushi_go/bindings/sushi_go_bindings.dart';

import 'package:game_board_scores/features/sushi_go/presentation/view/screens/sushi_go_screen_phase_1.dart';

class SushiGoPage extends Page<dynamic> {
  SushiGoPage()
      : super(
    name: Routes.sushiGo,
    view: SushiGoScreenPhase1.new,
    binding: SushiGoBinding(),
  );
}
