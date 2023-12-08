import 'package:flutter/cupertino.dart';

Widget sushiGoResultRow({required String name, required String points}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: <Widget>[
        Text(name),
        const Spacer(),
        Text(points),
      ],
    ),
  );
}