import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/saved/bindings/saved_bindings.dart';
import 'package:game_board_scores/features/saved/presentation/view/screens/saved_screen.dart';


class SavedPage extends Page<dynamic> {
  SavedPage()
      : super(
    name: Routes.saved,
    view: SavedScreen.new,
    binding: SavedBinding(),
  );
}
