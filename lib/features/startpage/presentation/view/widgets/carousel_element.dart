import 'package:flutter/material.dart';
import 'package:flutter_structure/features/startpage/presentation/view/widgets/stepper_widget.dart';
import 'package:get/get.dart';

Widget carouselWidget({
  required String title,
  required String subtitle,
  required String image,
  required int index,
}) {
  return Column(
    children: <Widget>[
      Image.asset(
        image,
        width: Get.width,
        fit: BoxFit.cover,
      ),
      SizedBox(
        height: Get.height * 0.02,
      ),
      Text(
        title,
        style: const TextStyle(
          fontFamily: 'Lora',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: Get.height * 0.01,
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontFamily: 'Lora',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: Get.height * 0.03,
      ),
      stepperWidget(index),
    ],
  );
}
