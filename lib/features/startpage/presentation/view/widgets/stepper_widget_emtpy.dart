import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';

Widget stepperWidgetEmpty() {
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.lightGrey,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    width: 10,
    height: 10,
  );
}
