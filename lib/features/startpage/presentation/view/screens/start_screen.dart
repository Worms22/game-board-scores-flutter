import 'package:carousel_slider/carousel_slider.dart';
import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/extensions/localizations_extension.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/base/widgets/app_button.dart';
import 'package:flutter_structure/features/startpage/presentation/view/widgets/carousel_element.dart';
import 'package:flutter_structure/features/startpage/presentation/view_models/start_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends Screen<StartViewModel> {
  StartScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: Get.height * 0.8,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    viewportFraction: 1,),
                itemCount: viewModel.carousel.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        carouselWidget(
                  title: viewModel.carousel[itemIndex].title,
                  subtitle: viewModel.carousel[itemIndex].subtitle,
                  image: viewModel.carousel[itemIndex].image,
                  index: itemIndex,
                ),
              ),
              AppButton(
                color: AppColors.secondary,
                isFill: true,
                isDisabled: false,
                width: Get.width * 0.8,
                textStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                onTap: () => viewModel.navigateToRegistration(),
                label: tr.registrationButton,
              ),
              SizedBox(
                height: Get.height * 0.01,
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
                onTap: () => viewModel.navigateToLogin(),
                label: tr.loginButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
