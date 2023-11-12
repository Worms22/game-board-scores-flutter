import 'package:flutter/material.dart';

/// A constant that allows to request an input filed with the following options:
///
/// * copy
/// * cut
/// * paste
/// * selectAll
const ToolbarOptions kAllToolbarOptions = ToolbarOptions(
  copy: true,
  cut: true,
  paste: true,
  selectAll: true,
);

/// A constant that allows to request a Keyboard with decimal operators.
const TextInputType kDecimalKeyboardType = TextInputType.numberWithOptions(
  decimal: true,
);

const String termsUrl =
    'https://www.google.it/';
const String privacyUrl = 'https://www.google.it/';

const String baseUrl = 'https://www.google.it/';
