// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

PopupMenuThemeData buildPopUpMenuTheme(PopupMenuThemeData original) {
  return original.copyWith(
    color: colorScheme.primary,
    textStyle: buildTextStyle(colorScheme.onPrimary, size: 50),
  );
}
