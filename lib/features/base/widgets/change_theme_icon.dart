import 'package:crow/crow.dart' as Crow;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChangeThemeIcon extends Crow.View {
  const ChangeThemeIcon({
    required this.themeModeService,
    super.key,
  });

  final Crow.ThemeModeService themeModeService;

  @override
  Widget? builder() {
    return Obx(
      () => InkWell(
        //onTap:  Crow.CrowthemeModeService.changeThemeMode,
        onDoubleTap: themeModeService.reset,
        borderRadius: BorderRadius.circular(24.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            themeModeService.isSystemMode
                ? Icons.brightness_auto_rounded
                : themeModeService.isDarkMode
                    ? Icons.dark_mode
                    : Icons.light_mode,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Crow.ThemeModeService>(
        'themeModeService',
        themeModeService,
      ),
    );
  }
}
