import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/signup/presentation/view_models/signup_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget noAccountSection(SignupViewModel viewModel) {
  return GestureDetector(
    onTap: () => viewModel.goToLogin(),
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
