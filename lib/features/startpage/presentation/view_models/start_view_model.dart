import 'package:crow/crow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_structure/features/base/router/app_routes.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/startpage/domain/entity/onboarding_entity.dart';
import 'package:get/get.dart';

class StartViewModel extends ViewModel with StateMixin<dynamic> {
  StartViewModel();

  List<OnboardingEntity> carousel = <OnboardingEntity>[
    OnboardingEntity(
      title: AppLocalizations.of(Get.context!)!.onboardingTitle1,
      subtitle: AppLocalizations.of(Get.context!)!.onboardingSubtitle1,
      image: Images.onboarding1,
    ),
    OnboardingEntity(
      title: AppLocalizations.of(Get.context!)!.onboardingTitle2,
      subtitle: AppLocalizations.of(Get.context!)!.onboardingSubtitle2,
      image: Images.onboarding2,
    ),
    OnboardingEntity(
      title: AppLocalizations.of(Get.context!)!.onboardingTitle3,
      subtitle: AppLocalizations.of(Get.context!)!.onboardingSubtitle3,
      image: Images.onboarding3,
    ),
  ];

  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onReady();
  }

  Future<void> navigateToRegistration() async {
    FlutterNativeSplash.remove();
    await Get.toNamed(Routes.registration);
  }

  Future<void> navigateToLogin() async {
    FlutterNativeSplash.remove();
    await Get.toNamed(Routes.login);
  }
}
