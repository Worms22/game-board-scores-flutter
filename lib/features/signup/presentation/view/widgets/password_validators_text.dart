import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_styles.dart';
import 'package:game_board_scores/features/base/utils/password_validator.dart';
import 'package:game_board_scores/features/signup/presentation/view_models/signup_view_model.dart';

Widget passwordValidatorsText(
  String? title,
  int index,
  dynamic viewModel,
) {
  return ListTile(
    dense: true,
    title: Text(
      title!,
      style: AppStyles.textStyleSmall.copyWith(
        color: Validators.passwordValidator(
          index,
          viewModel.passwordController,
          AppColors.lightGrey,
        ),
      ),
    ),
    minLeadingWidth: 10,
    leading: Icon(
      Icons.keyboard_arrow_down_sharp,
      color: Validators.passwordValidator(
        index,
        viewModel.passwordController,
        AppColors.lightGrey,
      ),
    ),
    contentPadding: EdgeInsets.zero,
    visualDensity: VisualDensity.compact,
  );
}
