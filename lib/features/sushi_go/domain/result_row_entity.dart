import 'package:crow/crow.dart';

class SushiResultRowEntity extends Entity {
  SushiResultRowEntity({
    required this.name,
    required this.points,
  });
  final String name;
  final String points;
}
