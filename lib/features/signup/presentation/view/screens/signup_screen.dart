import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/extensions/localizations_extension.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/base/widgets/app_button.dart';
import 'package:flutter_structure/features/base/widgets/app_circular_progress.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/input_data_section.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/no_account_section.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/privacy_section.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/text_section.dart';
import 'package:flutter_structure/features/signup/presentation/view_models/signup_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends Screen<SignupViewModel> {
  SignupScreen({super.key});

  @override
  Widget builder() {
    viewModel.onInvalidInput = _showSnackBarOnError;
    return viewModel.obx(
      (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      Images.splashLogo,
                      fit: BoxFit.fitWidth,
                      width: Get.width * 0.3,
                    ),
                  ),
                ),
                textSection(),
                inputDataSection(viewModel),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                privacyTermsSection(),
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
                  onTap: viewModel.nextStep,
                  label: tr.registrationNextStep,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                noAccountSection(viewModel),
                SizedBox(
                  height: Get.height * 0.06,
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
