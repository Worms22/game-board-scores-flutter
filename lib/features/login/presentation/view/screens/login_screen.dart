import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/extensions/localizations_extension.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/base/widgets/app_button.dart';
import 'package:flutter_structure/features/base/widgets/app_circular_progress.dart';
import 'package:flutter_structure/features/login/presentation/view/widgets/input_data_section.dart';
import 'package:flutter_structure/features/login/presentation/view/widgets/register_section.dart';
import 'package:flutter_structure/features/login/presentation/view_models/login_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends Screen<LoginViewModel> {
  LoginScreen({super.key});

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
                  height: Get.height * 0.04,
                ),


                SizedBox(
                  height: Get.height * 0.02,
                ),
                inputDataSection(viewModel),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        //onTap: () => launchUrl(Uri.parse(recoverPswUrl)),
                        child: Text(
                          tr.recoverPassword,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                AppButton(
                  isFill: true,
                  isDisabled: false,
                  width: Get.width * 0.8,
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onTap: viewModel.login,
                  label: tr.loginButton,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                registerSection(viewModel),
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
