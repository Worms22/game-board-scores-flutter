import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/home/presentation/view_models/home_view_model.dart';
import 'package:get/get.dart';

class SelectPlayerScreenPhase1 extends Screen<HomeViewModel> {
  SelectPlayerScreenPhase1({super.key});

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
            const Center(child: Text('Home')),
            SizedBox(
              height: Get.height * 0.3,
            ),

          ],
        ),
      ),
    );
  }
}
