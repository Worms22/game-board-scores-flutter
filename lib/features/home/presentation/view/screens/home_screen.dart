import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/images.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/home/presentation/view/widgets/home_card.dart';
import 'package:game_board_scores/features/home/presentation/view_models/home_view_model.dart';
import 'package:get/get.dart';

class HomeScreen extends Screen<HomeViewModel> {
  HomeScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
      (_) => !viewModel.isConnected.value
          ? Container()
          : Scaffold(
              appBar: AppBar(
                title: const Text('Home giochi'),
              ),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List<Widget>.generate(3, (int index) {
                      return homeCard( name: 'Sushi', image: Images.splashLogo, time: '10', players: '6-2');
                    }),
                  ),
                ),
              ),
            ),
    );
  }
}
