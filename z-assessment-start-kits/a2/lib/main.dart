// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './themes/theme.dart';
import './first-page.dart';

void main() => runApp(MyApp());

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey:
          scaffoldMessengerKey,
      title: 'A2 - User Input',
      debugShowCheckedModeBanner: false,
      home: MyFirstPage(),
      theme: buildTheme(),
    );
  }
}
