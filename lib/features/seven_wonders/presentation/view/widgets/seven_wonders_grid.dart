import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view/widgets/seven_wonders_row.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sevenWondersGrid({
  required String text,
  required int numberPhase,
  required List<TextEditingController> nameControllerList,
  required List<TextEditingController> pointsControllerList,
  required String? image,
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
      Container(
        //color: color,
        child: SizedBox(
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
                sevenWondersRow(
                  name: nameControllerList[i].text,
                  controller: pointsControllerList[i],
                ),
            ],
          ),
        ),
      ),
    ],
  );
}
