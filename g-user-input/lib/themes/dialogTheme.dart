// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/DialogTheme-class.html

DialogTheme buildDialogTheme(DialogTheme original) {
  return original.copyWith(
    backgroundColor: Colors.white,
    titleTextStyle: buildTextStyle(colorScheme.onPrimary, size: 25),
    contentTextStyle: buildTextStyle(colorScheme.onPrimary, size: 25),
  );
}
