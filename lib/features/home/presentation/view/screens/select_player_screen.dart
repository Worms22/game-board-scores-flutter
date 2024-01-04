import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:game_board_scores/features/base/widgets/chose_player_name_widget.dart';
import 'package:game_board_scores/features/home/presentation/view/widgets/home_card.dart';
import 'package:game_board_scores/features/home/presentation/view_models/home_view_model.dart';
import 'package:get/get.dart';

class SelectPlayersScreen extends Screen<HomeViewModel> {
  SelectPlayersScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : Scaffold(
              appBar: AppBar(
                title: const Text('Seleziona giocatore'),
              ),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    children: <Widget>[
                      ListView(
                        children: <Widget>[
                          chosePlayerNameWidget(
                            controllerList: viewModel.controllerList,
                          ),
                          SizedBox(height: Get.height * 0.3,),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        left: 10,
                        child: TextButton(
                          onPressed: () => viewModel.randomlySelectFirstPlayer(),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: AppColors.primary,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Select Random',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
