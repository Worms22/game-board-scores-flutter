import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/constants.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget privacyTermsSection() {
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap: () => launchUrl(Uri.parse(termsUrl)),
        child: Text.rich(
          TextSpan(
            text: AppLocalizations.of(Get.context!)!.termsSentence,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: AppLocalizations.of(Get.context!)!.terms,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => launchUrl(Uri.parse(privacyUrl)),
        child: Text.rich(
          TextSpan(
            text: AppLocalizations.of(Get.context!)!.privacySentence,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: AppLocalizations.of(Get.context!)!.privacyPolicy,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
