import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/utils/namespaces/dimensions.dart';
import 'package:flutter_structure/features/base/utils/password_validator.dart';
import 'package:flutter_structure/features/signup/presentation/view/widgets/password_validators_text.dart';
import 'package:flutter_structure/features/signup/presentation/view_models/signup_view_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

Widget passwordStrengthWidget(dynamic viewModel) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(
      Dimensions.paddingM,
      0,
      Dimensions.paddingM,
      0,
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.padding,
            bottom: Dimensions.padding,
          ),
          child: StepProgressIndicator(
            totalSteps: 3,
            currentStep: viewModel.currentNumIndicator,
            size: 7,
            selectedColor: Validators.stepProgressIndicationColor(
              viewModel.currentNumIndicator,
            ),
            roundedEdges: const Radius.circular(10),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return passwordValidatorsText(
              viewModel.passwordStrengthList[index],
              index,
              viewModel,
            );
          },
          shrinkWrap: true,
          itemCount: viewModel.passwordStrengthList.length,
        ),
      ],
    ),
  );
}
