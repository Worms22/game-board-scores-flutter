import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/home/bindings/home_bindings.dart';
import 'package:flutter_structure/features/home/presentation/view/screens/home_screen.dart';


class HomePage extends Page<dynamic> {
  HomePage()
      : super(
    name: Routes.home,
    view: HomeScreen.new,
    binding: HomeBinding(),
  );
}
