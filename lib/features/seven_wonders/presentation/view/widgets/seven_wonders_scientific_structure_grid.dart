import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/widgets/app_button.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/widgets/seven_wonders_row.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/widgets/seven_wonders_scientific_structure_row.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sevenWondersScientificStructureGrid({
  required String text,
  required int numberPhase,
  required List<TextEditingController> nameControllerList,
  required List<TextEditingController> pointsControllerList1,
  required List<TextEditingController> pointsControllerList2,
  required List<TextEditingController> pointsControllerList3,
  required List<TextEditingController> pointsControllerTotalsList,
  required String? image,
  required action,
}) {
  return Stack(
    children: <Widget>[
      if (image != null)
        Container(
          height: Get.height * 0.7,
          //child: Center(
          //    child: Image.asset(image, fit: BoxFit.fitHeight,),
          //),
        )
      else
        Container(),
      SizedBox(
        height: Get.height * 0.7,
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: <Widget>[
                  Text(
                    text,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            for (var i = 0; i < nameControllerList.length; i++)
              sevenWondersScientificStructureRow(
                name: nameControllerList[i].text,
                controller1: pointsControllerList1[i],
                controller2: pointsControllerList2[i],
                controller3: pointsControllerList3[i],
                controllerTotal: pointsControllerTotalsList[i],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(
                color: AppColors.wondersGold,
                borderColor: AppColors.wondersGold,
                isFill: true,
                isDisabled: false,
                width: Get.width * 0.8,
                textStyle: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                onTap: action,
                label: 'Calcola totali sezione',
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
