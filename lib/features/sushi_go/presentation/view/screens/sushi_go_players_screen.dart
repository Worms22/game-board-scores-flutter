import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/localizations_extension.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/base/widgets/chose_player_name_widget.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SushiGoPlayersScreen extends Screen<SushiGoViewModel> {
  SushiGoPlayersScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
          (_) => !viewModel.isConnected.value
          ? Container()
          : Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: Get.height * 0.01,
              ),
              chosePlayerNameWidget(viewModel.controllerList),
              AppButton(
                isFill: true,
                isDisabled: false,
                width: Get.width * 0.8,
                textStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                onTap: () => Get.toNamed(Routes.sushiGo),
                label: tr.loginButton,
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
