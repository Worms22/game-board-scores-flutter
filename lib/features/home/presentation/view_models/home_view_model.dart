import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crow/crow.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/home/domain/entities/game_entity.dart';
import 'package:game_board_scores/features/home/domain/home_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

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
    Get.toNamed(Routes.sushiGo);
  }

  void goToFirstPlayer({required bool isFirstPlayer}){
    if(isFirstPlayer){
      Get.toNamed(Routes.selectPlayers);
    }
  }

  void selectAction(int id){
    if(id == 2){
      goToFirstPlayer(isFirstPlayer: true);
    }
  }

  void randomlySelectFirstPlayer(){
    final List<String> list = [controller1.text, controller2.text, controller3.text, controller4.text, controller5.text];
    Get.defaultDialog(title: list.elementAt(Random().nextInt(list.length)));
  }


}
