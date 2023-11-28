import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Primo giocatore',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome primo giocatore',
                        controller: viewModel.controller1,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      const Text(
                        'Secondo giocatore',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),


                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome secondo giocatore',
                        controller: viewModel.controller2,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      const Text(
                        'Terzo giocatore',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome terzo giocatore',
                        controller: viewModel.controller3,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      const Text(
                        'Quarto giocatore',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome quarto giocatore',
                        controller: viewModel.controller4,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      const Text(
                        'Quinto giocatore',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome quinto giocatore',
                        controller: viewModel.controller5,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
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
                                      fontWeight: FontWeight.w600,),
                                ),
                              ),
                            ),
                          ),
                        ],),
                      SizedBox(height: Get.height * 0.05,),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
