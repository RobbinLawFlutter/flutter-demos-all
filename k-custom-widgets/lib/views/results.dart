// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/bottom-button.dart';
import 'package:robbinlaw/constants.dart';
import 'package:robbinlaw/widgets/reusable-card-enhanced.dart';

class Results extends StatelessWidget {
  const Results({required this.bmiResult, required this.dietClassString, required this.height, required this.weight, required this.age});

  final String bmiResult;
  final String dietClassString;
  final String height;
  final String weight;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietary Stats & BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Expanded(
            flex: 5,
            child: ReuseableCardEnhanced(
              myColor: kActiveCardColor,
              reusableCardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Diet Class: $dietClassString',
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'Height: $height cm',
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'Weight: $weight kg',
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'Age: $age',
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'BMI: $bmiResult',
                    style: kTitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              myText: 'BACK',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
