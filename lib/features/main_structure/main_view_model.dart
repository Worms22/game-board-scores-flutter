import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';
import 'package:flutter_structure/features/home/presentation/view/screens/home_screen.dart';
import 'package:flutter_structure/features/main_structure/domain/main_structure_repository.dart';
import 'package:flutter_structure/features/profile/presentation/view/screens/profile_screen.dart';
import 'package:flutter_structure/features/saved/presentation/view/screens/saved_screen.dart';
import 'package:get/get.dart';

class MainViewModel extends ViewModel with StateMixin<dynamic> {
  MainViewModel(
    this._mainStructureRepository,
  );

  final MainStructureRepository _mainStructureRepository;
  int currentIndex = 0;
  bool get isInitialIndex => currentIndex == 0;
  bool get isFirstIndex => currentIndex == 1;
  bool get isSecondIndex => currentIndex == 2;

  List<Widget> pages = <Widget>[
    HomeScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void changeNavIndex(int index) {
    currentIndex = index;
    update();
  }

  BoxDecoration selectedIndexDecoration() {
    return BoxDecoration(
      color: AppColors.lightGrey,
      borderRadius: BorderRadius.circular(16),
    );
  }

}
