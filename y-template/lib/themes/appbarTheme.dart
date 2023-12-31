// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/AppBarTheme-class.html

AppBarTheme buildAppBarTheme(AppBarTheme original) {
  return original.copyWith(
    color: colorScheme.primary,
    titleTextStyle: buildTextStyle(
      colorScheme.onPrimary,
      size: 30,
    ),
    centerTitle: true,
  );
}
