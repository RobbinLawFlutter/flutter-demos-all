// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/DialogTheme-class.html

ListTileThemeData buildListTileTheme(ListTileThemeData original) {
  return original.copyWith(
    tileColor: colorScheme.primary,
    titleTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
      fontStyle: FontStyle.italic,
    ),
    leadingAndTrailingTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
      fontStyle: FontStyle.italic,
    ),
    subtitleTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
      fontStyle: FontStyle.italic,
    ),
  );
}
