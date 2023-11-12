import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/splashscreen/presentation/view_model/splash_view_model.dart';
import 'package:get/get.dart';


class SplashScreen extends Screen<SplashViewModel> {
  SplashScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
          (_) => Scaffold(
            backgroundColor: AppColors.primary,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  Images.splashLogo,
                  fit: BoxFit.fitWidth,
                  width: Get.width * 0.5,
                ),
              ),
            ),
          ),
    );
  }
}
