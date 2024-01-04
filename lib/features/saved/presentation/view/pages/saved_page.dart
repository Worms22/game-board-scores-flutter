import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/saved/bindings/saved_bindings.dart';
import 'package:game_board_scores/features/saved/presentation/view/screens/saved_screen.dart';


class SavedPage extends Page<dynamic> {
  SavedPage()
      : super(
    name: Routes.saved,
    page: SavedScreen.new,
    binding: SavedBinding(),
  );
}
