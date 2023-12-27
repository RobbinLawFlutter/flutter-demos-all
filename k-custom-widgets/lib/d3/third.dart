// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/constants.dart';

// This MyThirdPage demonstrates the use of 
// font awesome Icons from pub.dev.
// Go to pub.dev and search for font_awesome_flutter
// package and download and configure pubspec.yaml.

class MyThirdPage extends StatefulWidget {
  @override
  MyThirdPageState createState() => MyThirdPageState();
}

class MyThirdPageState extends State<MyThirdPage> {
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
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          FontAwesomeIcons.burger,
                          size: 80,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'OMNIVORE',
                          style: kLabelTextStyle
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          FontAwesomeIcons.carrot,
                          size: 80,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'VEGETARIAN',
                          style: kLabelTextStyle
                        ),
                      ],
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
