import 'package:flutter/cupertino.dart';
import 'package:flutter_structure/features/startpage/presentation/view/widgets/stepper_widget_emtpy.dart';
import 'package:flutter_structure/features/startpage/presentation/view/widgets/stepper_widget_full.dart';

Widget stepperWidget(int index) {
  if (index == 0) {
    return Row(
      children: <Widget>[
        const Spacer(),
        stepperWidgetFull(),
        const SizedBox(width: 5,),
        stepperWidgetEmpty(),
        const SizedBox(width: 5,),
        stepperWidgetEmpty(),
        const Spacer(),
      ],
    );
  }
  if (index == 1) {
    return Row(
      children: <Widget>[
        const Spacer(),
        stepperWidgetEmpty(),
        const SizedBox(width: 5,),
        stepperWidgetFull(),
        const SizedBox(width: 5,),
        stepperWidgetEmpty(),
        const Spacer(),
      ],
    );
  }
  return Row(
    children: <Widget>[
      const Spacer(),
      stepperWidgetEmpty(),
      const SizedBox(width: 5,),
      stepperWidgetEmpty(),
      const SizedBox(width: 5,),
      stepperWidgetFull(),
      const Spacer(),
    ],
  );
}
