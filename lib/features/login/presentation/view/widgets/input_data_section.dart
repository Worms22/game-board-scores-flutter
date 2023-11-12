import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/base/widgets/app_text_field.dart';
import 'package:flutter_structure/features/login/presentation/view_models/login_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget inputDataSection(LoginViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: GoogleFonts.montserrat(
          fontSize: 12,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      AppTextField(
        isAutoCorrection: false,
        hint: AppLocalizations.of(Get.context!)!.insertEmail,
        controller: viewModel.emailController,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.emailAddress,
      ),
      SizedBox(
        height: Get.height * 0.04,
      ),
      Text(
        'Password',
        style: GoogleFonts.montserrat(
          fontSize: 12,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Obx(
        () => AppTextField(
          isAutoCorrection: false,
          hint: AppLocalizations.of(Get.context!)!.insertPassword,
          controller: viewModel.passwordController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          isObscure: viewModel.obscurePassword.value,
          suffixIcon:
              viewModel.obscurePassword.value ? Images.eye : Images.closeEye,
          isSuffix: true,
          errorText: '',
          suffixCallBack: () => viewModel.updatePassword(),
        ),
      ),
    ],
  );
}
