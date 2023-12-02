import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sushiGoRow({
  required String name,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        AppTextField(
          width: Get.width * 0.7,
          isAutoCorrection: false,
          hint: 'Inserisci il punteggio della fase',
          controller: controller,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
        )
      ],
    ),
  );
}
