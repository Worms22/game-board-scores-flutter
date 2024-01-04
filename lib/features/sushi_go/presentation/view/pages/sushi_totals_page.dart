import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/sushi_go/bindings/sushi_go_bindings.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/screens/sushi_go_totals_screen.dart';

class SushiGoTotalPage extends Page<dynamic> {
  SushiGoTotalPage()
      : super(
    name: Routes.sushiGoTotals,
    page: SushiGoTotalsScreen.new,
    binding: SushiGoBinding(),
  );
}
