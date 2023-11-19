import 'package:crow/crow.dart';

class HomeGameEntity extends Entity {
  HomeGameEntity({
    required this.id,
    this.title,
    this.time,
    this.players,
    this.image,
    this.firstPlayer = false,
  });
  final int id;
  final String? title;
  final String? time;
  final String? players;
  final String? image;
  bool firstPlayer;
}
