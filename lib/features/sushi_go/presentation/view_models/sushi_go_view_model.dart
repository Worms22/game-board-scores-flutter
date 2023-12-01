import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crow/crow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:game_board_scores/features/home/domain/entities/game_entity.dart';
import 'package:game_board_scores/features/home/domain/home_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class SushiGoViewModel extends ViewModel with StateMixin<dynamic> {
  SushiGoViewModel();

  RxString motivationalSentence = ''.obs;
  RxInt numb = 6.obs;
  late String name;
  RxBool isConnected = true.obs;
  String detailTitle = '';
  String? token;
  TextEditingController controllerNumOfPlayer = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  RxList<TextEditingController> controllerList = <TextEditingController>[].obs;

  @override
  Future<void> onReady() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('email') ?? '';
    token = prefs.getString('jwt_token');
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    isConnected.value = (connectivityResult != ConnectivityResult.none);
    await showNumOfPlayersDialog();
    change(null, status: RxStatus.success());
    super.onReady();
  }

  @override
  Future<void> init() async {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  void goToSushiGo() {
    Get.toNamed(Routes.sushiGoPlayers);
  }

  Future<void> showNumOfPlayersDialog() async {
    await Get.defaultDialog(
      title: 'Inserisci il numero di giocatori (max 5)',
      content: Column(
        children: <Widget>[
          AppTextField(
            width: Get.width * 0.9,
            isAutoCorrection: false,
            hint: 'Inserisci il numero di giocatori',
            controller: controllerNumOfPlayer,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
          ),
          TextButton(
            onPressed: addPlayersController,
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
                  'Aggiungi',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addPlayersController() {
    final List<TextEditingController> controllerList2 = <TextEditingController>[
      controller1,
      controller2,
      controller3,
      controller4,
      controller5,
    ];

    final Iterable<List<TextEditingController>> x = controllerList2.slices(
      int.parse(controllerNumOfPlayer.text),
    );
    controllerList.value = x.first;
    Get.back();
  }
}
