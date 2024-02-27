// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/widgets/reusable-card-simple.dart';
import 'package:robbinlaw/widgets/my-icon.dart';
import 'package:robbinlaw/constants.dart';

// This demonstrates the use of
// both custom widgets but now they are both
// modularized into their own my-icon.dart
// and reusable-card-simple.dart files.
// Also shows the use of enums.
// Also functionality with GestureDetector
// and setSate.

enum DietClass {
  notdeterminedyet('Not Determined'),
  omnivore('Omnivore'),
  vegetarian('Vegetarian');

  const DietClass(this.dietClassString);
  final String dietClassString;
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D5 - Modularization',
        ),
      ),
      body: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  Color omnivoreCardColor = kInactiveCardColor;
  Color vegetarianCardColor = kInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      //First way using a method to
                      //update the card color.
                      updateColor(DietClass.omnivore);
                    });
                    print('Omnivore card was pressed');
                  },
                  child: ReuseableCardSimple(
                    //First way updating color via
                    //variable that was changed in updateColor method.
                    myColor: omnivoreCardColor,
                    reusableCardChild: const MyIcon(
                      icon: FontAwesomeIcons.burger,
                      label: 'OMNIVORE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      //First way
                      updateColor(DietClass.vegetarian);
                    });
                    print('Vegetarian card was pressed');
                  },
                  child: ReuseableCardSimple(
                    //First way
                    myColor: vegetarianCardColor,
                    reusableCardChild: const MyIcon(
                      icon: FontAwesomeIcons.carrot,
                      label: 'VEGETARIAN',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReuseableCardSimple(
            myColor: kActiveCardColor,
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCardSimple(
                  myColor: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReuseableCardSimple(
                  myColor: kActiveCardColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: kBottomContainerColor,
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: kBottomContainerHeight,
        ),
      ],
    );
  }

  void updateColor(DietClass selectedDietClass) {
    if (selectedDietClass == DietClass.omnivore) {
      if (omnivoreCardColor == kInactiveCardColor) {
        omnivoreCardColor = kActiveCardColor;
        vegetarianCardColor = kInactiveCardColor;
      }
    }
    if (selectedDietClass == DietClass.vegetarian) {
      if (vegetarianCardColor == kInactiveCardColor) {
        vegetarianCardColor = kActiveCardColor;
        omnivoreCardColor = kInactiveCardColor;
      }
    }
  }
}
