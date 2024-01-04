import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';

class OnboardingEntity extends Entity {
  OnboardingEntity({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;
}
