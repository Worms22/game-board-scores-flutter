import 'package:crow/crow.dart';
import 'package:flutter_structure/features/base/app/presentation/app_view_model.dart';
import 'package:flutter_structure/features/base/network/client_service.dart';
import 'package:get/get.dart';

class AppBinding extends Binding {
  AppBinding._internal();

  static AppBinding get instance => _instance;

  static final AppBinding _instance = AppBinding._internal();

  static void initDependencies() {
    Get.lazyPut(() => AppViewModel(Get.find<ThemeModeService>()));
  }

  static Future<void> initAsyncServices() async {
    await Get.putAsync(() => ClientService().init());
  }

  @override
  void dependencies() {
    //UserBinding().dependencies();
  }
}
