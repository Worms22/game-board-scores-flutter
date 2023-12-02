import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_grid.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:get/get.dart';

class SushiGoScreenPhase1 extends Screen<SushiGoViewModel> {
  SushiGoScreenPhase1({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: 'Fase 1',
                      ),
                      Tab(
                        text: 'Fase 2',
                      ),
                      Tab(
                        text: 'Fase 3',
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
                  ],
                ),
              ),
            ),
    );
  }
}
