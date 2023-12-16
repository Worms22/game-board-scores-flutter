import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/widgets/seven_wonders_grid.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/widgets/seven_wonders_scientific_structure_grid.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view_models/seven_wonders_view_model.dart';
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
              length: 7,
              child: Scaffold(
                backgroundColor: AppColors.wondersSand,
                appBar: AppBar(
                  backgroundColor: AppColors.wondersSand,
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Image.asset(Images.piramid),
                      ),
                      Tab(
                        icon: Image.asset(Images.coin),
                      ),
                      Tab(
                        icon: Image.asset(Images.battle),
                      ),
                      Tab(
                        child: Container(
                          height: 25,
                          color: AppColors.wondersGold,
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 25,
                          color: AppColors.wondersGreen,
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 25,
                          color: AppColors.wondersBlue,
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 25,
                          color: AppColors.wondersPurple,
                        ),
                      ),
                    ],
                  ),
                  title: Text('Fasi di gioco'),
                ),
                body: Stack(
                  children: [
                    //Image.asset(Images.piramidBack, fit: BoxFit.fill,),

                    TabBarView(
                      children: <Widget>[
                        sevenWondersGrid(
                          text: 'Punti Meraviglia',
                          numberPhase: 1,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList: viewModel.controllerListStep1,
                          //color: AppColors.puddingPink,
                          image: null,
                        ),
                        sevenWondersGrid(
                          text: 'Punti Tesoro',
                          numberPhase: 2,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList: viewModel.controllerListStep2,
                          //color: AppColors.puddingPink,
                          image: null,
                        ),
                        sevenWondersGrid(
                          text: 'Punti Battaglia',
                          numberPhase: 3,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList: viewModel.controllerListStep3,
                          //color: AppColors.puddingPink,
                          image: null,
                        ),
                        sevenWondersGrid(
                          text: 'Punti Strutture Commerciali',
                          numberPhase: 3,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList: viewModel.controllerListStep4,
                          //color: AppColors.puddingPink,
                          image: '',
                        ),
                        sevenWondersScientificStructureGrid(
                          text: 'Punti Strutture Scientifiche',
                          numberPhase: 3,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList1:
                              viewModel.controllerListStep5Symb1,
                          pointsControllerList2:
                              viewModel.controllerListStep5Symb2,
                          pointsControllerList3:
                              viewModel.controllerListStep5Symb3,
                          //color: AppColors.puddingPink,
                          image: null,
                          action: () =>
                              viewModel.calculateScientificStructuresPoints(),
                          pointsControllerTotalsList:
                              viewModel.controllerTotalsListStep5,
                        ),
                        sevenWondersGrid(
                          text: 'Punti Strutture Civili',
                          numberPhase: 3,
                          nameControllerList: viewModel.controllerList,
                          pointsControllerList: viewModel.controllerListStep6,
                          //color: AppColors.puddingPink,
                          image: null,
                        ),
                        Container(
                          color: AppColors.wondersSand,
                          child: ListView(
                            children: <Widget>[
                              sevenWondersGrid(
                                text: 'Punti Gilde',
                                numberPhase: 3,
                                nameControllerList: viewModel.controllerList,
                                pointsControllerList:
                                    viewModel.controllerListStep7,
                                //color: AppColors.puddingPink,
                                image: null,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: AppButton(
                                  color: AppColors.wondersGold,
                                  borderColor: AppColors.wondersGold,
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
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
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
