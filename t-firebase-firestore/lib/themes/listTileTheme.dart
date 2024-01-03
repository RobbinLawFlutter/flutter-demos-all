// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/ListTile/titleTextStyle.html

ListTileThemeData buildListTileTheme(ListTileThemeData original) {
  return original.copyWith(
    titleTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
    ),
    leadingAndTrailingTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
    ),
    subtitleTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
    ),
  );
}
