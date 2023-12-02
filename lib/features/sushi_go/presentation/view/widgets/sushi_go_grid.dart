import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_row.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sushiGoGrid({
  required int numberPhase,
  required List<TextEditingController> nameControllerList,
  required List<TextEditingController> pointsControllerList,
}) {
  return Column(
    children: <Widget>[
      Text(
        'Punti della fase $numberPhase',
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      for (var i = 0; i < nameControllerList.length; i++)
        sushiGoRow(
          name: nameControllerList[i].text,
          controller: pointsControllerList[i],
        ),
    ],
  );
}
