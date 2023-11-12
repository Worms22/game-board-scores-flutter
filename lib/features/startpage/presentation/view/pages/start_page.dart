import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/startpage/bindings/start_binding.dart';
import 'package:flutter_structure/features/startpage/presentation/view/screens/start_screen.dart';

class StartPage extends Page<dynamic> {
  StartPage()
      : super(
    name: Routes.start,
    view: StartScreen.new,
    binding: StartBinding(),
  );
}
