import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/localizations_extension.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/base/widgets/chose_player_name_widget.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_result_list.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SushiGoTotalsScreen extends Screen<SushiGoViewModel> {
  SushiGoTotalsScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
          (_) => !viewModel.isConnected.value
          ? Container()
          : Scaffold(
        backgroundColor: AppColors.sushiGoFase3,
        appBar: AppBar(
          backgroundColor: AppColors.sushiGoFase3,
          title: const Text(
            'Risultati',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(Images.sushiWinner),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    'Il vincitore è: ',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    viewModel.winner,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: Get.height * 0.5,
                      child: sushiGoResultList(viewModel.resultList)),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  AppButton(
                    color: AppColors.sushiGoPrimary,
                    borderColor: AppColors.sushiGoPrimary,
                    isFill: true,
                    isDisabled: false,
                    width: Get.width * 0.8,
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    onTap: () => viewModel.goToHome(),
                    label: 'Torna alla Home',
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
