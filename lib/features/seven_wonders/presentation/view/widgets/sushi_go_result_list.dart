import 'package:flutter/cupertino.dart';
import 'package:game_board_scores/features/sushi_go/domain/result_row_entity.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view/widgets/sushi_go_result_row.dart';

Widget sushiGoResultList(List<SushiResultRowEntity> resultList){
  return ListView(
    reverse: true,
    children: <Widget>[
      for(var item in resultList)
      sushiGoResultRow( name: item.name ?? '', points: item.points ?? ''),
    ],
  );
}