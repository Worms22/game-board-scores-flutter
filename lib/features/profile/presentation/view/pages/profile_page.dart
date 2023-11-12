import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/profile/bindings/profile_bindings.dart';
import 'package:flutter_structure/features/profile/presentation/view/screens/profile_screen.dart';

class ProfilePage extends Page<dynamic> {
  ProfilePage()
      : super(
    name: Routes.profile,
    view: ProfileScreen.new,
    binding: ProfileBinding(),
  );
}
