import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


Widget futureDevelopment(){
  return ListView(
    children: <Widget>[
      Text(
        '- Aggiunta della lingua inglese',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      Text(
        '- Creazione di account giocatore',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      Text(
        '- Salvataggio delle statistiche di gioco (numero vittorie) e classifiche',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      Text(
        '- Possibilità di aggiungere amici',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      Text(
        '- Aggiunta di altri giochi come scala quaranta ed eventuali suggeriti',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
    ],
  );
}