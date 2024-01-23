// ignore_for_file: use_key_in_widget_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';
// D1 - Stack Widget
import 'package:robbinlaw/d1/demo-main.dart' as d1;
// D2 - Custom Fonts
import 'package:robbinlaw/d2/demo-main.dart' as d2;
// D3 - Icon Widget
import 'package:robbinlaw/d3/demo-main.dart' as d3;
// D4 - Card & ListTile Widgets
import 'package:robbinlaw/d4/demo-main.dart' as d4;
// D5 - Lambda Operator
import 'package:robbinlaw/d5/demo-main.dart' as d5;
// D6 - 
import 'package:robbinlaw/d6/demo-main.dart' as d6;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: d5.Demo(),
      theme: buildTheme(),
    );
  }
}