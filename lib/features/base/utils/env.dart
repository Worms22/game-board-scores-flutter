import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_environment/flutter_environment.dart';

String getBaseUrl(EnvironmentType environmentType) {
  late String baseUrl;
  switch (environmentType) {
    case EnvironmentType.dev:
    case EnvironmentType.alpha:
      baseUrl = dotenv.get('DEV_BASE_URL');
      break;
    case EnvironmentType.beta:
    case EnvironmentType.prod:
      baseUrl = dotenv.get('PROD_BASE_URL');
      break;
  }

  return baseUrl;
}

Color getEnvironmentBannerColor(EnvironmentType environmentType) {
  switch (environmentType) {
    case EnvironmentType.alpha:
      return Colors.red;
    case EnvironmentType.beta:
      return Colors.orange;
    case EnvironmentType.dev:
    case EnvironmentType.prod:
      return Colors.transparent;
  }
}

String? getSentryDsn(EnvironmentType environmentType) {
  if (kDebugMode) return '';
  switch (environmentType) {
    case EnvironmentType.dev:
    case EnvironmentType.alpha:
    case EnvironmentType.beta:
      return '';
    case EnvironmentType.prod:
      return dotenv.get('SENTRY_DSN');
  }
}
