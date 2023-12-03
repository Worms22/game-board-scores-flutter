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
import 'package:google_fonts/google_fonts.dart';
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

  TextEditingController controller1Step1 = TextEditingController();
  TextEditingController controller2Step1 = TextEditingController();
  TextEditingController controller3Step1 = TextEditingController();
  TextEditingController controller4Step1 = TextEditingController();
  TextEditingController controller5Step1 = TextEditingController();

  TextEditingController controller1Step2 = TextEditingController();
  TextEditingController controller2Step2 = TextEditingController();
  TextEditingController controller3Step2 = TextEditingController();
  TextEditingController controller4Step2 = TextEditingController();
  TextEditingController controller5Step2 = TextEditingController();

  TextEditingController controller1Step3 = TextEditingController();
  TextEditingController controller2Step3 = TextEditingController();
  TextEditingController controller3Step3 = TextEditingController();
  TextEditingController controller4Step3 = TextEditingController();
  TextEditingController controller5Step3 = TextEditingController();

  TextEditingController controller1Pudding = TextEditingController();
  TextEditingController controller2Pudding = TextEditingController();
  TextEditingController controller3Pudding = TextEditingController();
  TextEditingController controller4Pudding = TextEditingController();
  TextEditingController controller5Pudding = TextEditingController();

  RxList<TextEditingController> controllerList = <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep1 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep2 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep3 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListPudding =
      <TextEditingController>[].obs;

  List<int> totalList = <int>[];

  int total1 = 0;
  int total2 = 0;
  int total3 = 0;
  int total4 = 0;
  int total5 = 0;

  @override
  Future<void> onReady() async {
    setPointsControllers();
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

  void setPointsControllers() {
    controllerListStep1.value = <TextEditingController>[
      controller1Step1,
      controller2Step1,
      controller3Step1,
      controller4Step1,
      controller5Step1,
    ];

    controllerListStep2.value = <TextEditingController>[
      controller1Step2,
      controller2Step2,
      controller3Step2,
      controller4Step2,
      controller5Step2,
    ];

    controllerListStep3.value = <TextEditingController>[
      controller1Step3,
      controller2Step3,
      controller3Step3,
      controller4Step3,
      controller5Step3,
    ];

    controllerListPudding.value = <TextEditingController>[
      controller1Pudding,
      controller2Pudding,
      controller3Pudding,
      controller4Pudding,
      controller5Pudding,
    ];

    totalList = <int>[
      total1,
      total2,
      total3,
      total4,
      total5,
    ];
  }

  void countPuddingPoints() {
    final List<int> listOfPoints = <int>[];
    for (int i = 0; i < controllerList.length; i++) {
      if (controllerList[i].text != '') {
        listOfPoints.add(int.parse(controllerListPudding[i].text));
      }
    }
    listOfPoints.toSet().toList().sort();

    if (listOfPoints.first != listOfPoints.last) {
      for (int i = 0; i < controllerList.length; i++) {
        if (int.parse(controllerListPudding[i].value.text) ==
            listOfPoints.first) {
          totalList[i] = totalList[i] + 6;
        }
        if (int.parse(controllerListPudding[i].value.text) ==
            listOfPoints.last) {
          totalList[i] = totalList[i] - 6;
        }
      }
    }
  }

  void calculate() {
    for (int i = 0; i < controllerList.length; i++) {
      totalList[i] = totalList[i] +
          int.parse(controllerListStep1[i].value.text) +
          int.parse(controllerListStep2[i].value.text) +
          int.parse(controllerListStep3[i].value.text);
    }
  }

  void goToTotalsPage(){
    countPuddingPoints();
    calculate();
    Get.toNamed(Routes.sushiGoTotals);
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
}
