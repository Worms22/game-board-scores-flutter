import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_grid.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SushiGoScreenPhases extends Screen<SushiGoViewModel> {
  SushiGoScreenPhases({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : DefaultTabController(
              length: 4,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: <Widget>[
                      Tab(
                        text: 'Fase 1',
                      ),
                      Tab(
                        text: 'Fase 2',
                      ),
                      Tab(
                        text: 'Fase 3',
                      ),
                      Tab(
                        text: 'Pudding',
                      ),
                    ],
                  ),
                  title: Text('Fasi di gioco'),
                ),
                body: TabBarView(
                  children: <Widget>[
                    sushiGoGrid(
                      numberPhase: 1,
                      nameControllerList: viewModel.controllerList,
                      pointsControllerList: viewModel.controllerListStep1,
                    ),
                    sushiGoGrid(
                      numberPhase: 2,
                      nameControllerList: viewModel.controllerList,
                      pointsControllerList: viewModel.controllerListStep2,
                    ),
                    sushiGoGrid(
                      numberPhase: 3,
                      nameControllerList: viewModel.controllerList,
                      pointsControllerList: viewModel.controllerListStep3,
                    ),
                    Column(
                      children: <Widget>[
                        sushiGoGrid(
                          numberPhase: 4,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList: viewModel.controllerListPudding,
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
                          onTap: viewModel.goToTotalsPage,
                          label: 'Avanti',
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
