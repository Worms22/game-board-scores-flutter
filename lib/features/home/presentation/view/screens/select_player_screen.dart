import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
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
                    children: <Widget>[
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome primo giocatore',
                        controller: viewModel.controller1,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome secondo giocatore',
                        controller: viewModel.controller2,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome terzo giocatore',
                        controller: viewModel.controller3,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome quarto giocatore',
                        controller: viewModel.controller4,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      AppTextField(
                        isAutoCorrection: false,
                        hint: 'Inserisci nome quinto giocatore',
                        controller: viewModel.controller5,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                      ),
                      TextButton(
                        onPressed: () => viewModel.randomlySelectFirstPlayer(),
                        child: const Text('Select Random'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
