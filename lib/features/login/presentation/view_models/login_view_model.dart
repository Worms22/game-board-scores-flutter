import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/typedefs.dart';
import 'package:game_board_scores/features/login/domain/login_repository.dart';
import 'package:get/get.dart';

class LoginViewModel extends ViewModel with StateMixin<dynamic> {
  LoginViewModel(this._loginRepository);

  late MessengerCallback<String> onInvalidInput;
  String token = '';
  String email = '';
  String password = '';
  Rx<bool> completed = false.obs;
  final LoginRepository _loginRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  Rx<bool> obscurePassword = false.obs;

  @override
  Future<void> onInit() async {
    RxStatus.loading();
    super.onInit();
    RxStatus.success();
    change(loading, status: RxStatus.success());
  }

  Future<void> login() async {
    change(loading, status: RxStatus.loading());
    if (emailController.text == '' || passwordController.text == '') {
      change(loading, status: RxStatus.success());
      _showSnackBarOnError(AppLocalizations.of(context)!.noCorrectCredentials);
    } else {
      //de-comment this to use the real login function
      /*
      final bool isLoggedOk = await _loginRepository.login(
          emailController.text, passwordController.text,);*/
      const bool isLoggedOk = true;
      if (isLoggedOk) {
        change(loading, status: RxStatus.success());
        await Get.offAllNamed(Routes.mainPage);
      } else {
        change(loading, status: RxStatus.success());
        _showSnackBarOnError(
            AppLocalizations.of(context)!.noCorrectCredentials,);
      }
    }
  }

  void _showSnackBarOnError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        backgroundColor: Colors.red,
      ),
    );
  }

  void updatePassword() {
    obscurePassword.value = !obscurePassword.value;
  }


  Future<void> goToSignup() async {
    await Get.toNamed(Routes.registration);
  }
}
