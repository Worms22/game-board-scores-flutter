import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/localizations_extension.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/base/widgets/app_circular_progress.dart';
import 'package:game_board_scores/features/signup/presentation/view_models/signup_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreenStep2 extends Screen<SignupViewModel> {
  SignupScreenStep2({super.key});

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
                SizedBox(
                  height: Get.height * 0.1,
                ),
                const Text('Here insert all thing about step 2'),
                SizedBox(
                  height: Get.height * 0.5,
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
                  onTap: viewModel.signup,
                  label: tr.registrationNextStep,
                ),
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
