import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
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
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: Get.height * 0.3,
            ),
            const Center(
              child: Text('select players'),
            ),
            SizedBox(
              height: Get.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
