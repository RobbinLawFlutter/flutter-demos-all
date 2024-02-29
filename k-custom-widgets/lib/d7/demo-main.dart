// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/widgets/reusable-card-enhanced.dart';
import 'package:robbinlaw/widgets/my-icon.dart';
import 'package:robbinlaw/constants.dart';

// This demonstrates passing
// functions as args as the ReuseableCardSimple
// class has been enhanced to include
// the GestureDetector and its onTap property
// as a parameter. It is called
// ReuseableCardEnhanced.
// Also the use of a slider.

// Flutter Slider Widget of the Week
// https://www.youtube.com/watch?v=ufb4gIPDmEs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=58

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
          'D7 - Functions as Args',
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
  DietClass selectedDietClass = DietClass.notdeterminedyet;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCardEnhanced(
                  onPress: () {
                    setState(() {
                      selectedDietClass = DietClass.omnivore;
                    });
                  },
                  myColor: selectedDietClass == DietClass.omnivore
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  reusableCardChild: const MyIcon(
                    icon: FontAwesomeIcons.burger,
                    label: 'OMNIVORE',
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCardEnhanced(
                  onPress: () {
                    setState(() {
                      selectedDietClass = DietClass.vegetarian;
                    });
                  },
                  myColor: selectedDietClass == DietClass.vegetarian
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  reusableCardChild: const MyIcon(
                    icon: FontAwesomeIcons.carrot,
                    label: 'VEGETARIAN',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReuseableCardEnhanced(
            myColor: kActiveCardColor,
            reusableCardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'HEIGHT',
                  //style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      'cm',
                      //style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                    print(newValue);
                    print(height);
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCardEnhanced(
                  myColor: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReuseableCardEnhanced(
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
}
