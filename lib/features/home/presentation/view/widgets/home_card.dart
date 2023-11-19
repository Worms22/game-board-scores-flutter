import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/extensions/build_context_extension.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:get/get.dart';

Widget homeCard({
  required String name,
  required String image,
  String? players,
  String? time,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            color: Colors.blue,
            child: Image.asset(
              image,
              width: Get.width,
              height: Get.height * 0.17,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            name,
            style: const TextStyle(
                color: AppColors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (players != null)
              Chip(
                backgroundColor: Colors.white,
                elevation: 8.0,
                padding: const EdgeInsets.all(2.0),
                avatar: const CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                label: Text(players),
                shape: const StadiumBorder(

                ),
              )
            else
              Container(),
            if (time != null)
              Chip(
                padding: const EdgeInsets.all(2.0),
                avatar: const CircleAvatar(
                  child: Icon(
                    Icons.timelapse,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                label: Text(time ?? ''),
                shape: const StadiumBorder(
                ),
              )
            else
              Container(),
          ],
        ),
      ],
    ),
  );
}
