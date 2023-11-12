// ignore_for_file: invalid_use_of_protected_member

import 'package:crow/crow.dart' as Crow show Screen, View ;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension InternationalizetionState on State {
  AppLocalizations get tr => AppLocalizations.of(context)!;
}

extension InternationalizetionScreen on Crow.Screen {
  AppLocalizations get tr => AppLocalizations.of(context)!;
}

extension InternationalizetionView on Crow.View {
  AppLocalizations get tr => AppLocalizations.of(context)!;
}

extension InternationalizetionBuildContext on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
