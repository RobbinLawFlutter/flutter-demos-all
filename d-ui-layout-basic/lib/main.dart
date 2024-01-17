// ignore_for_file: use_key_in_widget_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';
// D1 - Text Widget
import 'package:robbinlaw/d1/demo-main.dart' as d1;
// D2 - Images
import 'package:robbinlaw/d2/demo-main.dart' as d2;
// D3 - Container Widget
import 'package:robbinlaw/d3/demo-main.dart' as d3;
// D4 - Padding Widget
import 'package:robbinlaw/d4/demo-main.dart' as d4;
// D5 - Align Widget
import 'package:robbinlaw/d5/demo-main.dart' as d5;
// D6 - Transform Widget
import 'package:robbinlaw/d6/demo-main.dart' as d6;
// D7 - Row & Column Widgets
import 'package:robbinlaw/d7/demo-main.dart' as d7;
// D8 - Expanded Widget
import 'package:robbinlaw/d8/demo-main.dart' as d8;
// D9 - 
import 'package:robbinlaw/d9/demo-main.dart' as d9;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: d3.Demo(),
      theme: buildTheme(),
    );
  }
}