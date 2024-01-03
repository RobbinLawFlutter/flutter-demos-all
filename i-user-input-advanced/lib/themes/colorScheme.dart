// ignore_for_file: file_names

import 'package:flutter/material.dart';

ColorScheme buildColorTheme(ColorScheme original) {
  return original.copyWith();
}

const ColorScheme colorScheme = ColorScheme(
  primary: basilGreen100,
  onPrimary: basilGreen800,
  secondary: basilNeutral,
  onSecondary: basilOrange800,
  surface: surfaceWhite,
  onSurface: basilGreen800,
  background: backgroundWhite,
  onBackground: basilGreen500,
  error: errorRed,
  onError: surfaceWhite,
  brightness: Brightness.light,
);

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

ColorScheme colorScheme3 = ColorScheme.fromSeed(
  brightness: Brightness.light,
  //brightness: Brightness.dark,
  seedColor: Colors.green,
  //seedColor: Colors.yellow,
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

const Color basilGreen800 = Color.fromARGB(255, 53, 104, 89);
const Color basilGreen500 = Color.fromARGB(255, 55, 150, 111);
const Color basilGreen100 = Color.fromARGB(100, 185, 228, 201);
const Color basilOrange800 = Color.fromARGB(255, 253, 85, 35);
const Color basilNeutral = Color.fromARGB(255, 255, 251, 230);
