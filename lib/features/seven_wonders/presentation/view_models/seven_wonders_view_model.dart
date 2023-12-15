import 'dart:async';

import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:game_board_scores/features/sushi_go/domain/result_row_entity.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SevenWondersViewModel extends ViewModel with StateMixin<dynamic> {
  SevenWondersViewModel();

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
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();

  TextEditingController controller1Step1 = TextEditingController();
  TextEditingController controller2Step1 = TextEditingController();
  TextEditingController controller3Step1 = TextEditingController();
  TextEditingController controller4Step1 = TextEditingController();
  TextEditingController controller5Step1 = TextEditingController();
  TextEditingController controller6Step1 = TextEditingController();
  TextEditingController controller7Step1 = TextEditingController();

  TextEditingController controller1Step2 = TextEditingController();
  TextEditingController controller2Step2 = TextEditingController();
  TextEditingController controller3Step2 = TextEditingController();
  TextEditingController controller4Step2 = TextEditingController();
  TextEditingController controller5Step2 = TextEditingController();
  TextEditingController controller6Step2 = TextEditingController();
  TextEditingController controller7Step2 = TextEditingController();

  TextEditingController controller1Step3 = TextEditingController();
  TextEditingController controller2Step3 = TextEditingController();
  TextEditingController controller3Step3 = TextEditingController();
  TextEditingController controller4Step3 = TextEditingController();
  TextEditingController controller5Step3 = TextEditingController();
  TextEditingController controller6Step3 = TextEditingController();
  TextEditingController controller7Step3 = TextEditingController();

  TextEditingController controller1Step4 = TextEditingController();
  TextEditingController controller2Step4 = TextEditingController();
  TextEditingController controller3Step4 = TextEditingController();
  TextEditingController controller4Step4 = TextEditingController();
  TextEditingController controller5Step4 = TextEditingController();
  TextEditingController controller6Step4 = TextEditingController();
  TextEditingController controller7Step4 = TextEditingController();

  TextEditingController controller1Step5 = TextEditingController();
  TextEditingController controller2Step5 = TextEditingController();
  TextEditingController controller3Step5 = TextEditingController();
  TextEditingController controller4Step5 = TextEditingController();
  TextEditingController controller5Step5 = TextEditingController();
  TextEditingController controller6Step5 = TextEditingController();
  TextEditingController controller7Step5 = TextEditingController();

  TextEditingController controller1Step6 = TextEditingController();
  TextEditingController controller2Step6 = TextEditingController();
  TextEditingController controller3Step6 = TextEditingController();
  TextEditingController controller4Step6 = TextEditingController();
  TextEditingController controller5Step6 = TextEditingController();
  TextEditingController controller6Step6 = TextEditingController();
  TextEditingController controller7Step6 = TextEditingController();

  TextEditingController controller1Step7 = TextEditingController();
  TextEditingController controller2Step7 = TextEditingController();
  TextEditingController controller3Step7 = TextEditingController();
  TextEditingController controller4Step7 = TextEditingController();
  TextEditingController controller5Step7 = TextEditingController();
  TextEditingController controller6Step7 = TextEditingController();
  TextEditingController controller7Step7 = TextEditingController();



  RxList<TextEditingController> controllerList = <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep1 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep2 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep3 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep4 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep5 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep6 =
      <TextEditingController>[].obs;
  RxList<TextEditingController> controllerListStep7 =
      <TextEditingController>[].obs;


  List<int> totalList = <int>[];
  List<SushiResultRowEntity> resultList = <SushiResultRowEntity>[];

  int total1 = 0;
  int total2 = 0;
  int total3 = 0;
  int total4 = 0;
  int total5 = 0;
  int total6 = 0;
  int total7 = 0;


  String winner = '';

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

  void goToSevenWonders() {
    Get.toNamed(Routes.sushiGoPlayers);
  }

  void addPlayersController() {
    final List<TextEditingController> controllerList2 = <TextEditingController>[
      controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6,
      controller7,
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
      controller6Step1,
      controller7Step1,
    ];

    controllerListStep2.value = <TextEditingController>[
      controller1Step2,
      controller2Step2,
      controller3Step2,
      controller4Step2,
      controller5Step2,
      controller6Step2,
      controller7Step2,
    ];

    controllerListStep3.value = <TextEditingController>[
      controller1Step3,
      controller2Step3,
      controller3Step3,
      controller4Step3,
      controller5Step3,
      controller6Step3,
      controller7Step3,
    ];

    controllerListStep4.value = <TextEditingController>[
      controller1Step4,
      controller2Step4,
      controller3Step4,
      controller4Step4,
      controller5Step4,
      controller6Step4,
      controller7Step4,
    ];

    controllerListStep5.value = <TextEditingController>[
      controller1Step5,
      controller2Step5,
      controller3Step5,
      controller4Step5,
      controller5Step5,
      controller6Step5,
      controller7Step5,
    ];

    controllerListStep6.value = <TextEditingController>[
      controller1Step6,
      controller2Step6,
      controller3Step6,
      controller4Step6,
      controller5Step6,
      controller6Step6,
      controller7Step6,
    ];

    controllerListStep7.value = <TextEditingController>[
      controller1Step7,
      controller2Step7,
      controller3Step7,
      controller4Step7,
      controller5Step7,
      controller6Step7,
      controller7Step7,
    ];


    totalList = <int>[
      total1,
      total2,
      total3,
      total4,
      total5,
      total6,
      total7,
    ];
  }



  void calculate() {
    for (int i = 0; i < controllerList.length; i++) {
      totalList[i] = totalList[i] +
          int.parse(controllerListStep1[i].value.text) +
          int.parse(controllerListStep2[i].value.text) +
          int.parse(controllerListStep3[i].value.text);
    }
  }

  void goToTotalsPage() {
    calculate();
    resultList = <SushiResultRowEntity>[];
    for (int i = 0; i < controllerList.length; i++) {
      resultList.add(
        SushiResultRowEntity(
          name: controllerList[i].text,
          points: totalList[i],
        ),
      );
    }

    resultList.sort((SushiResultRowEntity a, SushiResultRowEntity b) => a.points.compareTo(b.points));


    if(resultList[resultList.length - 2].points == resultList.last.points){
      winner = resultList.last.name + ' e ' + resultList[resultList.length - 2].name;
    }else{
      winner = resultList.last.name;
    }

    Get.toNamed(Routes.sushiGoTotals);
  }

  void goToHome(){
    Get.toNamed(Routes.home);
    Get.delete<SevenWondersViewModel>();

  }

  Future<void> showNumOfPlayersDialog() async {
    await Get.defaultDialog(
      title: 'Inserisci il numero di giocatori (max 7)',
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
