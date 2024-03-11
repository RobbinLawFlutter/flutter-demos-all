// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// InputDecoration Explain by 'flutter --help'
// https://www.youtube.com/watch?v=H2xNq5ph8OE

// https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html

// https://api.flutter.dev/flutter/material/TextSelectionTheme-class.html

// https://api.flutter.dev/flutter/material/TextSelectionThemeData-class.html

InputDecorationTheme buildInputDecorationTheme(InputDecorationTheme original) {
  return original.copyWith(
    //filled: true,
    fillColor: colorScheme.primary,
    focusColor: colorScheme.onPrimary,
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    //floatingLabelBehavior: FloatingLabelBehavior.auto,
    //constraints: BoxConstraints(maxWidth: 150),
    // borders
    enabledBorder: _buildBorderStyle(colorScheme.primary),
    errorBorder: _buildBorderStyle(colorScheme.error),
    focusedErrorBorder: _buildBorderStyle(colorScheme.error),
    focusedBorder: _buildBorderStyle(colorScheme.primary),
    disabledBorder: _buildBorderStyle(Colors.black26),
    // text
    suffixStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    counterStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    floatingLabelStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    errorStyle: buildTextStyle(colorScheme.error, size: 20),
    hintStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    helperStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    labelStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    prefixStyle: buildTextStyle(colorScheme.onPrimary, size: 20),
    // icons
    iconColor: colorScheme.onPrimary,
  );
}

OutlineInputBorder _buildBorderStyle(Color color,
    {double width = 2.0, Radius borderRadius = const Radius.circular(10)}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(borderRadius),
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
  );
}

TextSelectionThemeData textSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: colorScheme.onPrimary,
  );
}
