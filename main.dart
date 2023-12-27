// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';

// This MyFirstPage demonstrates the tree
// without any "custom widgets".
// We do use constants.dart for colors
// and text styles.
// This constants.dart taps into our themes.
import 'package:robbinlaw/views/first.dart';

// This MySecondPage demonstrates the use
// of a "custom widget" to reuse code.
// It displays the same as the MyFirstPage.
// It also shows the diff between const vs final.
import 'package:robbinlaw/views/second.dart';

// This MyThirdPage demonstrates the use of 
// font awesome Icons from pub.dev.
import 'package:robbinlaw/views/third.dart';

// This MyFourthPage demonstrates the use of 
// the icons but as another "custom widget"
// inside the ReuseableCardSimple custom widget.
// No functionality yet.
import 'package:robbinlaw/views/fourth.dart';

// This MyFifthPage demonstrates the use of 
// both custom widgets but now they are both 
// modularized into their own my-icon.dart 
// and reusable-card-simple.dart files.
// Also shows the use of enums.
// Also functionality with GestureDetector 
// and setSate.
import 'package:robbinlaw/views/fifth.dart';

// This MySixthPage demonstrates the
// use of a Ternary Operator instead of the
// updateColor() method.
import 'package:robbinlaw/views/sixth.dart';

// This MySeventhPage demonstrates passing 
// functions as args as the ReuseableCardSimple 
// class has been enhanced to include
// the GestureDetector and its onpressed property 
// as a parameter. It is called 
// ReuseableCardEnhanced.
// Also the use of a slider.
import 'package:robbinlaw/views/seventh.dart';

// This MyEighthPage demonstrates another custom
// widget called RoundIconButton which makes use
// of RawMaterialButton to compose a new widget from
// basic components.
// Also instead of the bottom container we have
// created another custom widget called BottomButton,
// but it does NOT do anything yet when pressed.
import 'package:robbinlaw/views/eighth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      //home: MyFirstPage(),
      //home: MySecondPage(),
      //home: MyThirdPage(),
      //home: MyFourthPage(),
      //home: MyFifthPage(),
      //home: MySixthPage(),
      //home: MySeventhPage(),
      home: MyEighthPage(),
    );
  }
}
