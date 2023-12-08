// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';
import 'package:robbinlaw/d6/first_page.dart';
import 'package:robbinlaw/d6/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Enable Demo',
      debugShowCheckedModeBanner: false,
      //home: MyFirstPage(),
      home: MySecondPage(),
      theme: buildTheme(),
    );
  }
}
