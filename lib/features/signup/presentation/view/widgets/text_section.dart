import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textSection(){
  return Column(
    children: <Widget>[
      SizedBox(
        height: Get.height * 0.04,
      ),
      Row(
        children: <Widget>[
          Text(
            AppLocalizations.of(Get.context!)!.signupTitle,
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const Spacer(),
        ],
      ),
      SizedBox(
        height: Get.height * 0.01,
      ),
      Text(
        AppLocalizations.of(Get.context!)!.signupSubtitle,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      SizedBox(
        height: Get.height * 0.02,
      ),
    ],
  );
}
