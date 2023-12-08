import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/build_context_extension.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';

import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget chosePlayerNameWidget({
  required List<TextEditingController> controllerList,
  Color? topColor,
  Color? bottomColor,
  Color? borderColor,
}) {
  return Obx(
    () => SizedBox(
      height: Get.height * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(controllerList.length, (int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.caramel),
                color: topColor ?? AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 15,
                    ),
                    child: Text(
                      'Giocatore ${index + 1}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppTextField(
                    borderColor: AppColors.caramel,
                    filledColor: bottomColor,
                    width: Get.width * 0.9,
                    isAutoCorrection: false,
                    hint: 'Inserisci nome giocatore',
                    controller: controllerList[index],
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ),
  );
}
