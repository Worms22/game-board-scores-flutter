import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view_models/sushi_go_view_model.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_grid.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SevenWondersScreenPhases extends Screen<SevenWondersViewModel> {
  SevenWondersScreenPhases({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : DefaultTabController(
              length: 4,
              child: Scaffold(
                backgroundColor: AppColors.puddingPink,
                appBar: AppBar(
                  backgroundColor: AppColors.puddingPink,
                  bottom:  TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          'Fase 1',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Fase 2',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Fase 3',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Pudding',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text('Fasi di gioco'),
                ),
                body: TabBarView(
                  children: <Widget>[
                    sushiGoGrid(
                      text: 'Punti della fase 1',
                      numberPhase: 1,
                      nameControllerList: viewModel.controllerList,
                      pointsControllerList: viewModel.controllerListStep1,
                      color: AppColors.puddingPink,
                    ),
                    sushiGoGrid(
                      text: 'Punti della fase 2',
                      numberPhase: 2,
                      nameControllerList: viewModel.controllerList,
                      pointsControllerList: viewModel.controllerListStep2,
                      color: AppColors.puddingPink,
                    ),
                    sushiGoGrid(
                      text: 'Punti della fase 3',
                      numberPhase: 3,
                      nameControllerList: viewModel.controllerList,
                      pointsControllerList: viewModel.controllerListStep3,
                      color: AppColors.puddingPink,
                    ),
                    Container(
                      color: AppColors.sushiGoFase1,
                      child: ListView(
                        children: <Widget>[
                          sushiGoGrid(
                            text: 'Numero di pudding',
                            numberPhase: 4,
                            nameControllerList: viewModel.controllerList,
                            pointsControllerList: viewModel.controllerListPudding,
                            color: AppColors.sushiGoFase1,
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AppButton(
                              color: AppColors.sushiGoPrimary,
                              borderColor: Colors.purple[200],
                              isFill: true,
                              isDisabled: false,
                              width: Get.width * 0.8,
                              textStyle: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              onTap: viewModel.goToTotalsPage,
                              label: 'Calcola totali',
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
