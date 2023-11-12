import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crow/crow.dart';
import 'package:game_board_scores/features/base/router/app_routes.dart';
import 'package:game_board_scores/features/home/domain/home_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectPlayersViewModel extends ViewModel with StateMixin<dynamic> {
  SelectPlayersViewModel(
      //this._homeRepository,
      );
  //final HomeRepository _homeRepository;

  RxInt numb = 6.obs;
  late String name;
  RxBool isConnected = true.obs;
  String detailTitle = '';
  String? token;

  @override
  Future<void> onReady() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('email') ?? '';
    token = prefs.getString('jwt_token');
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    //isConnected.value = (connectivityResult != ConnectivityResult.none);

    change(null, status: RxStatus.success());
    super.onReady();
  }

  @override
  Future<void> init() async {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  goToGames(){
    Get.toNamed(Routes.sushiGo);
  }


}
