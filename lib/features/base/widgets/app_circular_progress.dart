import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';

class AppCircularProgress extends StatelessWidget {
  const AppCircularProgress({
    super.key,
    this.radius = 15,
    this.androidProgressInsideStack = true,
  });
  final double radius;
  final bool androidProgressInsideStack;

  @override
  Widget build(BuildContext context) {
    return _platformIndicator;
  }

  Widget get _platformIndicator {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(radius: radius);
    } else {
      return SizedBox(
        height: radius * 2,
        width: radius * 2,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('radius', radius));
    properties.add(
      DiagnosticsProperty<bool>(
        'androidProgressInsideStack',
        androidProgressInsideStack,
      ),
    );
  }
}
