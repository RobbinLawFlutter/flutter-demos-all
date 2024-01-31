// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/main.dart';

class MySnackBar {
  String text;
  MySnackBar({required this.text});

  void show() {
    print(scaffoldMessengerKey.currentState);
    print(scaffoldMessengerKey.currentWidget);
    scaffoldMessengerKey.currentState?.showSnackBar(createSnackBar());
  }

  SnackBar createSnackBar(){
  return SnackBar(
    duration: const Duration(seconds: 10),
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
    action: SnackBarAction(
        label: 'Click',
        onPressed: () {
          print('hey you clicked on the snackbar Action');
        },
      ),
  );
}
}