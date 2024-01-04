import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

class SushiResultRowEntity extends Entity {
  SushiResultRowEntity({
    required this.name,
    required this.points,
  });
  final String name;
  final int points;
}
