import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/base/utils/namespaces/font_size.dart';
import 'package:flutter_structure/features/base/utils/namespaces/fonts.dart';

extension AppStyles on Never {
  static TextStyle buttonDarkTextStyle = const TextStyle(
    color: AppColors.black,
    fontFamily: Fonts.petitaBold,
    fontWeight: FontWeight.w300,
    fontSize: FontSize.fontSize,
  );

  static TextStyle buttonLightTextStyle = textStyleMedium.copyWith(
    color: AppColors.white,
  );

  static TextStyle textStyleSmall = const TextStyle(
    fontFamily: Fonts.petitaMedium,
    fontWeight: FontWeight.w500,
    fontSize: FontSize.fontSize,
  );

  static TextStyle textStyleMedium = const TextStyle(
    fontFamily: Fonts.petitaMedium,
    fontWeight: FontWeight.w400,
    fontSize: FontSize.fontSizeM,
  );

  static TextStyle textStyleLargeBold = const TextStyle(
    fontFamily: Fonts.petitaBold,
    fontWeight: FontWeight.w500,
    fontSize: FontSize.fontSizeL,
  );

  static TextStyle textStyleExtraLarge = const TextStyle(
    fontFamily: Fonts.petitaMedium,
    fontWeight: FontWeight.w500,
    fontSize: FontSize.fontSizeXL,
  );

  static TextStyle errorTextStyle = const TextStyle(
    color: AppColors.errorTextColor,
    fontWeight: FontWeight.w400,
    fontSize: FontSize.fontSizeXS,
  );
}
