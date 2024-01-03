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
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Expanded(
            flex: 5,
            child: ReuseableCardEnhanced(
              myColor: kInactiveCardColor,
              reusableCardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: kActiveCardColor),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(30,5,30,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Diet Class: ', style: kLabelTextStyle),
                        Text(
                          ' $dietClassString',
                          style: kTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: kActiveCardColor),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(30,5,30,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height: ', style: kLabelTextStyle),
                        Text(
                          ' $height cm',
                          style: kTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: kActiveCardColor),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(30,5,30,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight: ', style: kLabelTextStyle),
                        Text(
                          ' $weight kg',
                          style: kTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: kActiveCardColor),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(30,5,30,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age: ', style: kLabelTextStyle),
                        Text(
                          ' $age',
                          style: kTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: kActiveCardColor),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(30,5,30,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('BMI: ', style: kLabelTextStyle),
                        Text(
                          ' $bmiResult',
                          style: kTitleTextStyle,
                        ),
                      ],
                    ),
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
