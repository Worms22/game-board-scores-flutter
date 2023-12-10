import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/localizations_extension.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/base/widgets/chose_player_name_widget.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view_models/seven_wonders_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SevenWondersPlayersScreen extends Screen<SevenWondersViewModel> {
  SevenWondersPlayersScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : Scaffold(
              backgroundColor: AppColors.wondersSand,
              appBar: AppBar(
                backgroundColor: AppColors.wondersSand,
                title: const Text(
                  'Aggiungere i giocatori: ',
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
                    ListView(
                      children: <Widget>[
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        chosePlayerNameWidget(
                            controllerList: viewModel.controllerList,
                            topColor: AppColors.wondersBronze,
                            bottomColor: AppColors.wondersSilver,
                            borderColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: Get.height * 0.5,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      right: 20,
                      child: AppButton(
                        color: AppColors.wondersGold,
                        borderColor: AppColors.wondersGold,
                        isFill: true,
                        isDisabled: false,
                        width: Get.width * 0.8,
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        onTap: () => Get.toNamed(Routes.sevenWonders),
                        label: 'Continua',
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
