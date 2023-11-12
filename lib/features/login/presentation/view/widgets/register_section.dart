import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/login/presentation/view_models/login_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget registerSection(LoginViewModel viewModel) {
  return GestureDetector(
    onTap: () => viewModel.goToSignup(),
    child: Column(
      children: <Widget>[
        Center(
          child: Text(
            AppLocalizations.of(Get.context!)!.noAccount,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
        Center(
          child: Text(
            AppLocalizations.of(Get.context!)!.registrationButton,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
