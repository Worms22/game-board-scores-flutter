import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/home/presentation/view_models/home_view_model.dart';
import 'package:get/get.dart';

class SushiGoScreenPhase1 extends Screen<HomeViewModel> {
  SushiGoScreenPhase1({super.key});

  @override
  Widget builder() {
    return viewModel.obx((_) => !viewModel.isConnected.value
        ? Container()
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Fase 1',),
                    Tab(text: 'Fase 2',),
                    Tab(text: 'Fase 3',),
                  ],
                ),
                title: Text('Fasi di gioco'),
              ),
              body: const TabBarView(
                children: <Widget>[
                  Icon(Icons.flight, size: 350),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.directions_car, size: 350),
                ],
              ),
            ),
          ),
    );
  }
}
