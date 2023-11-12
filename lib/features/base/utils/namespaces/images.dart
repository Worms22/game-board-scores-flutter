import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension Images on Never {
  //authentication
  //static const String loginBackground = 'assets/images/loginBackground.png';
  //static const String logoTitle = 'assets/images/logoTitle.png';
  static const String splashLogo = 'assets/images/splashLogo.png';
  static const String eye = 'assets/images/eye.svg';
  static const String closeEye = 'assets/images/closedEye.svg';

//onboarding
  static const String onboarding1 = 'assets/images/Onboarding1.png';
  static const String onboarding2 = 'assets/images/Onboarding1.png';
  static const String onboarding3 = 'assets/images/Onboarding1.png';

  //main structure
  static const String homeIcon = 'assets/images/homeIcon.svg';
  static const String savedIcon = 'assets/images/savedIcon.svg';
  static const String profileIcon = 'assets/images/profileIcon.svg';

  Widget customSvgAsset({
    String? svgImage,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return SvgPicture.asset(
      svgImage!,
      width: width,
      height: height,
      fit: fit!,
    );
  }
}
