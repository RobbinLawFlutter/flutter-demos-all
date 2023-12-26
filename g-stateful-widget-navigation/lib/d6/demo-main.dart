// ignore_for_file: use_key_in_widget_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/d6/first_page.dart';
import 'package:robbinlaw/d6/second_page.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D6 - Switch-Button-Enable',
        ),
      ),
      body: MySecondPage(),
    );
  }
}
