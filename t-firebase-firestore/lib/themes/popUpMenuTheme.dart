// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

PopupMenuThemeData buildPopUpMenuTheme(PopupMenuThemeData original) {
  return original.copyWith(
    textStyle: buildTextStyle(colorScheme.onPrimary, size: 25),
  );
}
