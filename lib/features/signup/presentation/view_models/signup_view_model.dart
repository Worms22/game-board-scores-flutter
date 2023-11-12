import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/extensions/validate_email_extension.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/base/utils/password_validator.dart';
import 'package:flutter_structure/features/base/utils/typedefs.dart';
import 'package:flutter_structure/features/signup/domain/signup_repository.dart';
import 'package:get/get.dart';

class SignupViewModel extends ViewModel with StateMixin<dynamic> {
  SignupViewModel(this._signupRepository);

  late MessengerCallback<String> onInvalidInput;
  String token = '';
  String email = '';
  String password = '';
  Rx<bool> completed = false.obs;
  final SignupRepository _signupRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  bool loading = false;
  Rx<bool> obscurePassword = false.obs;
  int currentNumIndicator = 0;
  List<String> passwordStrengthList = <String>[];
  bool validatePassword = false;
  bool isDisabled = true;
  bool validateConfirmPassword = false;
  bool validateEmail = false;

  @override
  Future<void> onInit() async {
    RxStatus.loading();
    passwordStrengthList = <String>[
      AppLocalizations.of(Get.context!)!.passwordStrength1,
      AppLocalizations.of(Get.context!)!.passwordStrength2,
      AppLocalizations.of(Get.context!)!.passwordStrength3,
    ];
    super.onInit();
    RxStatus.success();
    change(loading, status: RxStatus.success());
  }

  Future<void> signup() async {
    //da cambiareeeeeee
    change(loading, status: RxStatus.loading());
    /*final bool isSignedOk = await _signupRepository.signup(
          emailController.text, passwordController.text,); */

    const bool isSignedOk = true;
    if (isSignedOk) {
      change(loading, status: RxStatus.success());
      await Get.offAndToNamed(Routes.mainPage);
    } else {
      change(loading, status: RxStatus.success());
      _showSnackBarOnError(
        AppLocalizations.of(context)!.noCorrectCredentials,
      );
    }
  }

  Future<void> nextStep() async {
    await Get.toNamed(Routes.registrationStep2);
  }

  Future<void> goToLogin() async {
    await Get.toNamed(Routes.login);
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

  void onTextChanged() {
    currentNumIndicator = Validators.checkPassword(passwordController.text);
    update();
  }

  void validatePasswordOnChanged() {
    checkIfCanContinue();
    onTextChanged();
    if (passwordController.text.isNotEmpty) {
      validatePassword = false;
    } else {
      validatePassword = true;
    }
    if (passwordConfirmController.text.isNotEmpty) {
      validateConfirmPasswordOnChanged();
    }
    update();
  }

  void validateConfirmPasswordOnChanged() {
    checkIfCanContinue();
    if (passwordConfirmController.text.isNotEmpty &&
        passwordConfirmController.text == passwordController.text) {
      validateConfirmPassword = false;
    } else {
      validateConfirmPassword = true;
    }
    update();
  }

  void validateEmailOnChanged() {
    checkIfCanContinue();
    if (emailController.text.isNotEmpty &&
        emailController.text.isValidEmail()) {
      validateEmail = false;
    } else {
      validateEmail = true;
    }
    update();
  }

  void checkIfCanContinue() {
    if (emailController.text.isNotEmpty &&
        emailController.text.isValidEmail() &&
        passwordController.text.isNotEmpty &&
        passwordController.text == passwordConfirmController.text) {
      isDisabled = false;
    } else {
      isDisabled = true;
    }
    update();
  }
}
