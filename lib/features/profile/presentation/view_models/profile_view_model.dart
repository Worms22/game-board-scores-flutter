import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:game_board_scores/features/base/extensions/validate_email_extension.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/password_validator.dart';
import 'package:game_board_scores/features/profile/domain/profile_repository.dart';
import 'package:game_board_scores/features/profile/presentation/view/widgets/be_sure_dialog.dart';
import 'package:game_board_scores/features/profile/presentation/view/widgets/future_development.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileViewModel extends ViewModel with StateMixin<dynamic> {
  ProfileViewModel(
    this._profileRepository,
  );
  final ProfileRepository _profileRepository;

  RxString motivationalSentence = ''.obs;
  RxInt numb = 6.obs;
  late String name;
  RxBool isConnected = true.obs;
  String detailTitle = '';
  String? token;
  RxString appVersion = ''.obs;
  String email = '';
  String password = '';
  Rx<bool> completed = false.obs;
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
  Future<void> onReady() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('jwt_token');
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    isConnected.value = (connectivityResult != ConnectivityResult.none);
    passwordStrengthList = <String>[
      AppLocalizations.of(Get.context!)!.passwordStrength1,
      AppLocalizations.of(Get.context!)!.passwordStrength2,
      AppLocalizations.of(Get.context!)!.passwordStrength3,
    ];
    change(null, status: RxStatus.success());
    super.onReady();
  }

  @override
  Future<void> init() async {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  Future<void> doYouWantLogout() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return beSureDialog(
          title: AppLocalizations.of(Get.context!)!.logoutTitleDialog,
          buttonTitle: AppLocalizations.of(Get.context!)!.logout,
          action: () async => logout(),);
      },
    );
  }

  Future<void> doYouWantDelete() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return beSureDialog(
          title: AppLocalizations.of(Get.context!)!.deleteTitleDialog,
          subtitle: AppLocalizations.of(Get.context!)!.deleteSubtitleDialog,
          buttonTitle: AppLocalizations.of(Get.context!)!.deleteButton,
          action: () async => deleteUser(),);
      },
    );
  }

  Future<void> logout() async {
    change(null, status: RxStatus.loading());
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    await Get.offAndToNamed(Routes.login);
    change(null, status: RxStatus.success());
  }

  Future<void> deleteUser() async {
    change(null, status: RxStatus.loading());

    final SharedPreferences pref = await SharedPreferences.getInstance();
    //await _profileRepository.deleteUser(user?.id ?? '');
    await pref.clear();
    await Get.offAndToNamed(Routes.login);
    change(null, status: RxStatus.success());
  }



  void updatePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onNavToDetail() {
    Get.toNamed<void>(Routes.users);
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
    if (
        passwordController.text.isNotEmpty &&
        passwordController.text == passwordConfirmController.text) {
      isDisabled = false;
    } else {
      isDisabled = true;
    }
    update();
  }

  Future<void> navigateToChangePassword() async {
    await Get.toNamed(Routes.changePassword);
  }

  Future<void> savePassword() async {
    //set here all the operations to save the new password
    Get.back();
  }

  Future<void> showFutureDevelopmentDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Sviluppi futuri'),
          content: futureDevelopment(),
        );


      },
    );
  }

  Future<void> newFeatureRequest()async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'nicolas.22.nv@gmail.com',
      query: 'subject=Proposte sviluppi', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
