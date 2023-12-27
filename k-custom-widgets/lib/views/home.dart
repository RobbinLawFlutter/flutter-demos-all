// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/widgets/reusable-card-enhanced.dart';
import 'package:robbinlaw/widgets/my-icon.dart';
import 'package:robbinlaw/widgets/round-icon-button.dart';
import 'package:robbinlaw/widgets/bottom-button.dart';
import 'package:robbinlaw/constants.dart';
import 'package:robbinlaw/views/results.dart';
import 'package:robbinlaw/calculator.dart';

enum DietClass {
  notdeterminedyet('Not Det'),
  omnivore('Omnivore'),
  vegetarian('Vegetarian');

const DietClass(this.dietClassString);
final String dietClassString;
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DietClass selectedDietClass = DietClass.notdeterminedyet;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietary Stats & BMI Calculator'),
      ),
      body: Column(
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
                    reusableCardChild: MyIcon(
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
                    reusableCardChild: MyIcon(
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
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
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
                      Text(
                        'cm',
                        style: kLabelTextStyle,
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
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                weight++;
                                setState(() {});
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCardEnhanced(
                    myColor: kActiveCardColor,
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            myText: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    dietClassString: selectedDietClass.dietClassString,
                    height: height.toString(),
                    weight: weight.toString(),
                    age: age.toString(),
                    bmiResult: calc.calculateBMI(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
