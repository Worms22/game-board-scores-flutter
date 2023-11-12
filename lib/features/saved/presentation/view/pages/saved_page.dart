import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/saved/bindings/saved_bindings.dart';
import 'package:flutter_structure/features/saved/presentation/view/screens/saved_screen.dart';


class SavedPage extends Page<dynamic> {
  SavedPage()
      : super(
    name: Routes.saved,
    view: SavedScreen.new,
    binding: SavedBinding(),
  );
}
