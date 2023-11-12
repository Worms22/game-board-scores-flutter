import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/app_colors.dart';

class Validators {
  static final RegExp numReg = RegExp('.*[0-9].*');
  static final RegExp upperCaseReg = RegExp('.*[A-Z].*');
  static final RegExp lowerCaseReg = RegExp('.*[a-z].*');

  static Color stepProgressIndicationColor(int currentNumIndicator) {
    switch (currentNumIndicator) {
      case 1:
        return AppColors.errorTextColor;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.green;
    }
  }

  static Color passwordValidator(
      int index,
      TextEditingController passwordController,
      Color primaryTextColor,
      ) {
    switch (index) {
      case 0:
        if (passwordController.text.length >= 8) {
          return Colors.green;
        } else {
          return primaryTextColor;
        }
      case 1:
        if (upperCaseReg.hasMatch(passwordController.text) &&
            lowerCaseReg.hasMatch(passwordController.text)) {
          return Colors.green;
        } else {
          return primaryTextColor;
        }
      case 2:
        if (numReg.hasMatch(passwordController.text)) {
          return Colors.green;
        } else {
          return primaryTextColor;
        }

      default:
        return primaryTextColor;
    }
  }

  static int checkPassword(String value) {
    if (value.isEmpty) {
      return 0;
    }
    if (value.length < 6) {
      return 1;
    } else if (value.length < 8) {
      return 1;
    } else if (lowerCaseReg.hasMatch(value) &&
        upperCaseReg.hasMatch(value) &&
        numReg.hasMatch(value)) {
      return 3;
    } else {
      // Password length >= 8
      // Password contains both letter and digit characters
      return 2;
    }
  }
}
