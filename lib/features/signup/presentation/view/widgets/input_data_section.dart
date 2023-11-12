import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/base/widgets/app_text_field.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/password_strength_widget.dart';
import 'package:flutter_structure/features/signup/presentation/view_models/signup_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget inputDataSection(SignupViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(Get.context!)!.email,
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
        onChanged: (_) => viewModel.validateEmailOnChanged(),
        controller: viewModel.emailController,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.emailAddress,
        isError: viewModel.validateEmail,
        errorText: AppLocalizations.of(Get.context!)!.registrationErrorEmail,
      ),
      SizedBox(
        height: Get.height * 0.04,
      ),
      Text(
        AppLocalizations.of(Get.context!)!.password,
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
          onChanged: (_) => viewModel.validatePasswordOnChanged(),
          controller: viewModel.passwordController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          isObscure: viewModel.obscurePassword.value,
          suffixIcon:
              viewModel.obscurePassword.value ? Images.eye : Images.closeEye,
          isSuffix: true,
          suffixCallBack: () => viewModel.updatePassword(),
          isError: viewModel.validatePassword,
          errorText:
              AppLocalizations.of(Get.context!)!.registrationErrorPassword,
        ),
      ),
      SizedBox(
        height: Get.height * 0.04,
      ),
      Text(
        AppLocalizations.of(Get.context!)!.passwordConfirm,
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
          hint: AppLocalizations.of(Get.context!)!.insertPasswordConfirm,
          onChanged: (_) => viewModel.validateConfirmPasswordOnChanged(),
          controller: viewModel.passwordConfirmController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          isObscure: viewModel.obscurePassword.value,
          suffixIcon:
              viewModel.obscurePassword.value ? Images.eye : Images.closeEye,
          isSuffix: true,
          isError: viewModel.validateConfirmPassword,
          errorText: AppLocalizations.of(Get.context!)!
              .registrationErrorConfirmPassword,
          suffixCallBack: () => viewModel.updatePassword(),
        ),
      ),
      passwordStrengthWidget(viewModel),
    ],
  );
}
