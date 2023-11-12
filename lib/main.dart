import 'package:crow/crow.dart' as Crow;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_environment/flutter_environment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:game_board_scores/features/base/app/bindings/app_binding.dart';
import 'package:game_board_scores/features/base/app/presentation/app_view_model.dart';
import 'package:game_board_scores/features/base/router/app_router.dart';
import 'package:game_board_scores/features/base/sevrices/navigation_service.dart';
import 'package:game_board_scores/features/base/theme/app_theme.dart';
import 'package:game_board_scores/features/base/utils/env.dart';
import 'package:get/get.dart';



void main() async {
  await dotenv.load();

  Environment(
    color: Colors.red.shade900,
    environmentType: EnvironmentType.dev,
    values: EnvironmentValues(
      getBaseUrl(EnvironmentType.dev),
    ),
  );

  await Crow.Crow.instance.initAsyncServices();
  Crow.Crow.instance.initDependencies();
  await AppBinding.initAsyncServices();
  AppBinding.initDependencies();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends Crow.View<AppViewModel> {
  const MyApp({super.key});

  @override
  Widget? builder() {
    return Obx(
      () => GetMaterialApp(
        theme: AppTheme().light(),
        darkTheme: AppTheme().dark(),
        navigatorKey: NavigationService.navigatorKey,
        themeMode: viewModel.themeModeService.themeMode.value,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        initialRoute: AppRouter.initial,
        initialBinding: AppBinding.instance,
        getPages: AppRouter.pages,
      ),
    );
  }
}
