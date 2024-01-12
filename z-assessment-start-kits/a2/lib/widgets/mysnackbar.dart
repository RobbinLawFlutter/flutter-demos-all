// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../main.dart';

class MySnackBar {
  String text;
  MySnackBar({required this.text});

  void show() {
    //print(scaffoldMessengerKey.currentState);
    scaffoldMessengerKey.currentState?.showSnackBar(get());
  }
  SnackBar get(){
  return SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const Icon(Icons.accessibility_new_rounded),
        const SizedBox(
          width: 10,
        ),
        Text(text),
      ],
    ),
  );
}
}