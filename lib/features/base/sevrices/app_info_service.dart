import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AppInfoService extends Service {
  String get buildVersion {
    for (int i = 0; i < _fullVersion.runes.length; i++) {
      final int charCode = _fullVersion.runes.elementAt(i);
      final String char = String.fromCharCode(charCode);
      if (char == '+') {
        return _fullVersion.replaceRange(0, i + 1, '');
      }
    }
    return _fullVersion;
  }

  String get version {
    for (int i = 0; i < _fullVersion.runes.length; i++) {
      final int charCode = _fullVersion.runes.elementAt(i);
      final String char = String.fromCharCode(charCode);
      if (char == '+') {
        return _fullVersion.replaceRange(i, _fullVersion.length, '');
      }
    }
    return _fullVersion;
  }

  String get fullVersion => _fullVersion;
  late String _fullVersion;

  Future<AppInfoService> init() async {
    final String yamlValue = await rootBundle.loadString('pubspec.yaml');
    final YamlMap pubspec = loadYaml(yamlValue);
    _fullVersion = pubspec['version'];

    return this;
  }
}
