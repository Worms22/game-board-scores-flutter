import 'package:crow/crow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_structure/features/base/utils/namespaces/images.dart';
import 'package:flutter_structure/features/main_structure/main_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class MainScreen extends Screen<MainViewModel> {
  MainScreen({super.key});

  @override
  Widget builder() {
    return viewModel.obx(
          (_) => Scaffold(
            backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: viewModel.changeNavIndex,
          type: BottomNavigationBarType.fixed,
          currentIndex: viewModel.currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black87,
          showSelectedLabels: true,
          items: bottomNavigationItem(),
        ),
        body: viewModel.pages[viewModel.currentIndex],
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationItem() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          width: 64,
          height: 32,
          decoration: viewModel.isInitialIndex
              ? viewModel.selectedIndexDecoration()
              : null,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Images.homeIcon,
            ),
          ),
        ),
        label: AppLocalizations.of(Get.context!)!.home,
      ),
      BottomNavigationBarItem(
        icon: Container(
          width: 64,
          height: 32,
          decoration: viewModel.isFirstIndex
              ? viewModel.selectedIndexDecoration()
              : null,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Images.savedIcon,
            ),
          ),
        ),
        label: AppLocalizations.of(Get.context!)!.saved,
      ),
      BottomNavigationBarItem(
        icon: Container(
          width: 64,
          height: 32,
          padding: const EdgeInsets.all(4),
          decoration: viewModel.isSecondIndex
              ? viewModel.selectedIndexDecoration()
              : null,
          child: SvgPicture.asset(
            Images.profileIcon,
          ),
        ),
        label: AppLocalizations.of(Get.context!)!.profile,
      ),
    ];
  }
}
