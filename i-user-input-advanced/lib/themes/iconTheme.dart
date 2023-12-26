// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';

// https://api.flutter.dev/flutter/widgets/IconThemeData-class.html

IconThemeData buildIconTheme(IconThemeData original) {
  return original.copyWith(color: colorScheme.onPrimary);
}