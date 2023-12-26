// ignore_for_file: file_names

import 'package:flutter/material.dart';

ColorScheme buildColorTheme(ColorScheme original) {
  return original
      .copyWith();
}

const ColorScheme colorScheme2 = ColorScheme(
  primary: pink100,
  onPrimary: brown900,
  secondary: pink50,
  onSecondary: brown600,
  surface: surfaceWhite,
  onSurface: brown900,
  background: backgroundWhite,
  onBackground: brown900,
  error: errorRed,
  onError: surfaceWhite,
  brightness: Brightness.light,
);

const ColorScheme colorScheme = ColorScheme(
  primary: basilGreen100,
  onPrimary: basilGreen800,
  secondary: pink50,
  onSecondary: brown600,
  surface: surfaceWhite,
  onSurface: brown900,
  background: backgroundWhite,
  onBackground: brown900,
  error: errorRed,
  onError: surfaceWhite,
  brightness: Brightness.light,
);

const Color blue200 = Color(0xFF80DEEA);

const Color pink50 = Color(0xFFFEEAE6);
const Color pink100 = Color(0xFFFEDBD0);
const Color pink300 = Color(0xFFFBB8AC);
const Color pink400 = Color(0xFFEAA4A4);

const Color brown900 = Color(0xFF442B2D);
const Color brown600 = Color(0xFF7D4F52);

const Color errorRed = Color(0xFFC5032B);

const Color surfaceWhite = Color(0xFFFFFBFA);
const Color backgroundWhite = Colors.white;

const Color basilGreen800 = Color(0xFF356859);
const Color basilGreen500 = Color(0xFF37966F);
const Color basilGreen100 = Color(0xFFB9E4C9);
const Color basilOrange800 = Color(0xFFFD5523);
const Color basilNeutral = Color(0xFFFFFBE6);

ColorScheme colorScheme3 = ColorScheme.fromSeed(
  brightness: Brightness.light,
  //brightness: Brightness.dark,
  seedColor: Colors.green,
  //seedColor: Colors.yellow,
);