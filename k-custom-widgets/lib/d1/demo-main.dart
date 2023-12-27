// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/constants.dart';

// This demonstrates the tree
// without any "custom widgets".
// We do use constants.dart for colors
// and text styles.
// This constants.dart taps into our themes.

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D1 - No Custom Widgets',
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kActiveCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kActiveCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kActiveCardColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kActiveCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kActiveCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
