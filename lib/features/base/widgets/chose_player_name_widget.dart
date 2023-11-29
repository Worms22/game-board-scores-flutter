import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/build_context_extension.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';

import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget chosePlayerNameWidget(
  List<TextEditingController> controllerList,
) {
  return Obx(
    () => SizedBox(
      height: Get.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(controllerList.length, (int index) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
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
                  width: Get.width * 0.9,
                  isAutoCorrection: false,
                  hint: 'Inserisci nome giocatore',
                  controller: controllerList[index],
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),
              ],
            ),
          );
        }),
      ),
    ),
  );
}
