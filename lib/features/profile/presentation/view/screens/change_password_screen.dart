import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/base/widgets/app_button.dart';
import 'package:flutter_structure/features/base/widgets/app_circular_progress.dart';
import 'package:flutter_structure/features/base/widgets/app_text_field.dart';
import 'package:flutter_structure/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/password_strength_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends Screen<ProfileViewModel> {
  ChangePasswordScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
          (_) => Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(Get.context!)!.password),
            ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.03,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                AppButton(
                  isFill: true,
                  isDisabled: viewModel.isDisabled,
                  width: Get.width * 0.8,
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onTap: viewModel.savePassword,
                  label: AppLocalizations.of(Get.context!)!
                    .save,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
      onLoading: _buildLoader(),
    );
  }

  Widget _buildLoader() {
    return Container(
      height: context.height,
      width: context.width,
      color: AppColors.white,
      child: const Center(
        child: AppCircularProgress(),
      ),
    );
  }

  void _showSnackBarOnError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        backgroundColor: Colors.red,
      ),
    );
  }
}
