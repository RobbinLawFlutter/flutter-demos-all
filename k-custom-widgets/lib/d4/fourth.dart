// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/constants.dart';

// This MyFourthPage demonstrates the use of 
// the icons but as another "custom widget"
// inside the ReuseableCardSimple custom widget.
// No functionality yet.

class MyFourthPage extends StatefulWidget {
  @override
  MyFourthPageState createState() => MyFourthPageState();
}

class MyFourthPageState extends State<MyFourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietary Stats & BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
                    reusableCardChild: const MyIcon(
                      icon: FontAwesomeIcons.burger,
                      label: 'OMNIVORE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
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
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle
        ),
      ],
    );
  }
}

class ReuseableCardSimple extends StatelessWidget {
  const ReuseableCardSimple({required this.myColor, this.reusableCardChild});

  final Color myColor;

  final Widget? reusableCardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: reusableCardChild,
    );
  }
}
