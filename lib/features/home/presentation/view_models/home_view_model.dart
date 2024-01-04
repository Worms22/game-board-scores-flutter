import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
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

class HomeViewModel extends ViewModel with StateMixin<dynamic> {
  HomeViewModel(
    this._homeRepository,
  );
  final HomeRepository _homeRepository;

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

  List<HomeGameEntity> listOfGame = <HomeGameEntity>[
    HomeGameEntity(
      id: 1,
      title: 'Sushi Go',
      players: '2-5',
      time: '15',
      image: Images.sushiGo,
    ),
    HomeGameEntity(
      id: 2,
      title: 'Select player',
      image: Images.selectPlayer,
      firstPlayer: true,
    ),
    HomeGameEntity(
      id: 3,
      title: '7 Wonders',
      image: Images.sevenWonders,
      players: '2-7',
      time: '30',
    ),
  ];

  @override
  Future<void> onReady() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('email') ?? '';
    token = prefs.getString('jwt_token');
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    isConnected.value = (connectivityResult != ConnectivityResult.none);

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

  void goTo7Wonders() {
    Get.toNamed(Routes.sevenWondersPlayers);
  }

  void goToFirstPlayer({required bool isFirstPlayer}) {
    if (isFirstPlayer) {
      showNumOfPlayersDialog();
    }
  }

  void selectAction(int id) {
    switch(id){
      case 1:
        goToSushiGo();
        break;
      case 2:
        goToFirstPlayer(isFirstPlayer: true);
        break;
      case 3:
        goTo7Wonders();
        break;
    }
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

  void randomlySelectFirstPlayer() {
    final List<String> list = <String>[
      controller1.text,
      controller2.text,
      controller3.text,
      controller4.text,
      controller5.text,
    ];

    list.removeWhere((String element) => element == '');

    final String firstPlayer = list.elementAt(
      Random().nextInt(list.length),
    );

    Get.defaultDialog(
      title: '',
      content: Column(
        children: <Widget>[
          Image.asset(
            Images.firstPlayerImage,
            width: Get.width * 0.5,
            height: Get.width * 0.5,
          ),
          const Text(
            'Il primo ad iniziare è: ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            firstPlayer,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
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

    final Iterable<List<TextEditingController>> x =
        controllerList2.slices(int.parse(controllerNumOfPlayer.text),);
    controllerList.value = x.first;

    Get.toNamed(Routes.selectPlayers);

  }
}
