import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/signup/bindings/signup_binding.dart';
import 'package:flutter_structure/features/signup/presentation/view/screens/signup_screen_step2.dart';

class SignupPageStep2 extends Page<dynamic> {
  SignupPageStep2()
      : super(
    name: Routes.registrationStep2,
    view: SignupScreenStep2.new,
    binding: SignupBinding(),
  );
}
