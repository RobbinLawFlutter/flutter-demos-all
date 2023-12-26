// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robbinlaw/themes/colorScheme.dart';

// https://api.flutter.dev/flutter/material/TextTheme-class.html

// https://api.flutter.dev/flutter/painting/TextStyle-class.html

TextTheme buildTextTheme(TextTheme original) {
  return original
      .copyWith(
        displayLarge: GoogleFonts.oswald(),
        displayMedium: GoogleFonts.oswald(),
        displaySmall: GoogleFonts.pacifico(),
        headlineMedium: GoogleFonts.oswald(),
        //Used for large text in dialogs
        //(e.g., the month and year in the dialog shown by showDatePicker)
        headlineSmall: GoogleFonts.oswald(),
        //Used for the primary text in app bars and dialogs
        //(e.g., AppBar.title and AlertDialog.title).
        titleLarge: GoogleFonts.oswald(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        //Used for the primary text in lists (e.g., ListTile.title)
        //and the TextField edited text.
        titleMedium: GoogleFonts.oswald(),
        //For medium emphasis text that's a little smaller than subtitle1
        titleSmall: GoogleFonts.oswald(),
        //Used for emphasizing text that would otherwise be bodyText2.
        bodyLarge: GoogleFonts.oswald(),
        //The default text style for material.
        //Color for ListTile.trailing
        bodyMedium: GoogleFonts.merriweather(),
        //Used for auxiliary text with images.
        //Used for ListTile.subtile
        bodySmall: GoogleFonts.oswald(),
        //Used for text on ElevatedButton, TextButton, and OutlinedButton
        //if no others
        labelLarge: GoogleFonts.oswald(),
      );
}

TextStyle buildTextStyle(Color color, {double size = 16.0, FontWeight weight = FontWeight.w500}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight,
    letterSpacing: defaultLetterSpacing,
  );
}

const defaultLetterSpacing = 0.09;
