import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/constants.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget settingSection(ProfileViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            AppLocalizations.of(Get.context!)!.privacyPolicyProfile,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          onTap: () => launchUrl(Uri.parse(privacyUrl)),
        ),
        const Divider(),
        ListTile(
          title: Text(
            AppLocalizations.of(Get.context!)!.termsProfile,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          onTap: () => launchUrl(Uri.parse(termsUrl)),
        ),
        const Divider(),
        ListTile(
          title: Text(
            AppLocalizations.of(Get.context!)!.logout,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          onTap: () => viewModel.doYouWantLogout(),
        ),
        const Divider(),
        ListTile(
          title: Text(
            AppLocalizations.of(Get.context!)!.deleteAccount,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
          onTap: () => viewModel.doYouWantDelete(),
        ),
        const Divider(),
        ListTile(
          title: Text(
            '${AppLocalizations.of(Get.context!)!.version}: ${viewModel.appVersion.value}',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
