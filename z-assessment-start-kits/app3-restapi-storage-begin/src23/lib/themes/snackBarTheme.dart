// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/SnackBarThemeData-class.html

SnackBarThemeData buildSnackBarTheme(SnackBarThemeData original) {
  return original.copyWith(
    backgroundColor: colorScheme.primary,
    contentTextStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
  );
}