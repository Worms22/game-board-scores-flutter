import 'package:crow/crow.dart';

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
