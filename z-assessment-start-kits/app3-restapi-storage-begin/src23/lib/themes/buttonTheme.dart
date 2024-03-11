// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

TextButtonThemeData buildTextButtonThemeData(TextButtonThemeData original) {
  return TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorScheme.primary),
        foregroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
        textStyle: MaterialStateProperty.all(
          buildTextStyle(colorScheme.onPrimary, size: 20),
        )),
  );
}

OutlinedButtonThemeData buildOutlinedButtonThemeData(
    OutlinedButtonThemeData original) {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorScheme.primary),
        //backgroundColor: MaterialStateProperty.all(_colorScheme.background),
        foregroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
        textStyle: MaterialStateProperty.all(
          buildTextStyle(colorScheme.onPrimary, size: 20),
        )),
  );
}

ElevatedButtonThemeData buildElevatedButtonThemeData(
    ElevatedButtonThemeData? original) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        //The buttons background fill color.
        backgroundColor:
            MaterialStateProperty.resolveWith<Color>(_getBackgroundColor),
        //The color of the buttons text and icon descendant widgets.
        foregroundColor:
            MaterialStateProperty.resolveWith<Color>(_getForegroundColor),
        textStyle: MaterialStateProperty.all(
          buildTextStyle(colorScheme.onPrimary, size: 20),
        )),
  );
}

Color _getBackgroundColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return colorScheme.primary.withOpacity(0.5);
  }
  return colorScheme.primary;
}

Color _getForegroundColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return colorScheme.onPrimary.withOpacity(0.5);
  }
  return colorScheme.onPrimary;
}
