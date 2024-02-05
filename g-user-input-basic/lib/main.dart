// ignore_for_file: use_key_in_widget_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';
// D1 - Stateless Widget DICE
import 'package:robbinlaw/d1/demo-main.dart' as d1;
// D2 - Stateful Widget DICE
import 'package:robbinlaw/d2/demo-main.dart' as d2;
// D3- Buttons with SnakeBar
import 'package:robbinlaw/d3/demo-main.dart' as d3;
// D4 - AppBar Buttons with SnakeBar
import 'package:robbinlaw/d4/demo-main.dart' as d4;
// D5 - Navigation with Buttons
import 'package:robbinlaw/d5/demo-main.dart' as d5;
// D6 - AppBar Dropdown Menu
import 'package:robbinlaw/d6/demo-main.dart' as d6;
// D7 - Navigation with AppBar Dropdown Menu
import 'package:robbinlaw/d7/demo-main.dart' as d7;

void main(){
  runApp(MyApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey:
          scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: d7.Demo(),
      theme: buildTheme(),
    );
  }
}