import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sevenWondersResultRow({required String name, required String points}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.sushiGoFase4,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue, width: 5,)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            Text(
              points,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}