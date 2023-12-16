import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/widgets/app_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sevenWondersRow({
  required String name,
  required TextEditingController controller,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: Get.height *0.02),
    child: Row(
      children: <Widget>[
        Text(
          name,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        AppTextField(
          width: Get.width * 0.15,
          isAutoCorrection: false,
          hint: '0',
          controller: controller,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
        ),
        const SizedBox(width: 10,),
        Text(
          'punti',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
      ],
    ),
  );
}
