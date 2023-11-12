import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget beSureDialog({
  required String title,
  required action,
  required String buttonTitle,
  String? subtitle,
}) {
  return AlertDialog(
    title: Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          subtitle ?? '',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: AppColors.primary,
              width: 4.0,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) => Colors.white,),
          shape: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: Get.back,
        child: Text(
          AppLocalizations.of(Get.context!)!.cancel,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) => AppColors.primary,),
          shape: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () => action(),
        child: Text(
          buttonTitle,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
