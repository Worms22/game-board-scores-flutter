import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/seven_wonders/bindings/seven_wonders_bindings.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/screens/seven_wonders_totals_screen.dart';

class SevenWondersTotalPage extends Page<dynamic> {
  SevenWondersTotalPage()
      : super(
    name: Routes.sevenWondersTotals,
    page: SevenWondersTotalsScreen.new,
    binding: SevenWondersBinding(),
  );
}
