import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_row.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sushiGoGrid({
  required String text,
  required int numberPhase,
  required List<TextEditingController> nameControllerList,
  required List<TextEditingController> pointsControllerList,
  required Color color,
}) {
  return Container(
    color: color,
    child: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          sushiGoRow(
            name: nameControllerList[i].text,
            controller: pointsControllerList[i],
          ),
      ],
    ),
  );
}
