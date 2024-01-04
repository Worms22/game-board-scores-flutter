import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/profile/presentation/view/widgets/setting_section.dart';
import 'package:game_board_scores/features/profile/presentation/view/widgets/user_section.dart';
import 'package:game_board_scores/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends Screen<ProfileViewModel> {
  ProfileScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                children: <Widget>[
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                    child: Text(
                      'Settings',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  ListTile(
                    onTap: () => viewModel.showFutureDevelopmentDialog(),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Sviluppi futuri',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),

                  //userSection(viewModel),
                  //const Center(child: Text('Custom fields')),
                  settingSection(viewModel),

                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Html(
                        data:
                            'Illustration by <a href="https://icons8.com/illustrations/author/zD2oqC8lLBBA">Icons 8</a> from <a href="https://icons8.com/illustrations">Ouch!</a>'),
                  ),
                  SizedBox(
                    height: Get.height * 0.3,
                  ),
                ],
              ),
            ),
    );
  }
}
