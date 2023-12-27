// ignore_for_file: use_key_in_widget_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import './first_page.dart' as p1;
import './second_page.dart' as p2;

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D6 - Switch-Button-Enable',
        ),
      ),
      body: p1.MyPage(),
    );
  }
}
