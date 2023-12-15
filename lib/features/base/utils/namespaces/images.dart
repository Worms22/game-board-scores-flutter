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

  //games general
  static const String sushiGo = 'assets/images/sushi-go.jpg';
  static const String sevenWonders = 'assets/images/7-wonders-image.png';
  static const String selectPlayer = 'assets/images/spin-wheel.png';
  static const String firstPlayerImage = 'assets/images/dadi.png';

  //sushigo
  static const String sushiBack1 = 'assets/images/sushi-background1.png';
  static const String sushiBack2 = 'assets/images/sushi-background2.png';
  static const String sushiBack3 = 'assets/images/sushi-background3.png';
  static const String sushiBack4 = 'assets/images/sushi-background4.png';
  static const String sushiWinner = 'assets/images/sushi-winner.png';


  //7 wonders
  static const String piramid = 'assets/images/piramid.png';
  static const String coin = 'assets/images/coin.png';
  static const String battle = 'assets/images/battle.png';
  static const String wondersBlueIcon = 'assets/images/wondersBlue.png';


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
