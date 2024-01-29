// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D1 - Stateless Widget DICE',
        ),
      ),
      body: Dice(),
    );
  }
}

// With a StatelessWidget we do not have a mechanism to
// update the UI after the first and only initial build, unless we hot
// restart the program with new variable values.
class Dice extends StatelessWidget {
  // We cannot put class instance fields here (unless we mark them final)
  // because a stateless widget is immutable (can't change).
  //int myInt1 = 1;
  // If we do mark a class instance field as final it must be initialized.
  //final int myInt2;
  final int myInt3 = 1;

  // We also cannot mark a class field as const unless
  // we also mark it as static and then it will become
  // a field that all objects instantiated from this class
  // will share and not get their own copy of it.
  //const int myInt4 = 2;
  // The key word static must go in front of the key word const.
  static const int myInt5 = 2;

  @override
  Widget build(BuildContext context) {
    print('The build method is being RUN');
    // We can put local variables inside the build method but
    // their scope is only inside the method.
    // If we change these numbers and hot restart the
    // images on the phone will update.
    // We can hot restart by pressing ctrl+s
    // It will NOT work if we hot reload.
    int leftDiceNumber = 4;
    var rightDiceNumber = 2;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              // This will not work as expected because
              // flutter will call and run
              // the named method as it is building the UI.
              // The result is that the method will only happen
              // once when the build is called at program restart.
              // Pressing the TextButton will NOT cause the method
              // to run.
              //onPressed: reactToButtonPress1(),

              // This will work as expected because it is a pointer
              // to the named method.
              // This method must return type dynamic (nothing)
              // and cannot take args.
              //onPressed: reactToButtonPress1,

              // The structure below is the signature
              // for a void-callback also called in some
              // languages an anonymous function (no name).
              // A function with no name and in this case no parms.
              // It is the only way to call a function that may
              // return something and that has parms.
              // When flutter builds the UI it does not run
              // the anonymous function but attaches the pointer
              // to where the function is located in memory
              // to the onPressed property.
              // The code inside the anonymous function is run
              // only when the onPressed event is triggered.
              onPressed: () {
                int returnValue = reactToButtonPress2('left', leftDiceNumber);
                leftDiceNumber = returnValue;
              },
              child: Image.asset(
                './lib/assets/images/dice$leftDiceNumber.png',
                color: Colors.blueGrey,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                int returnValue = reactToButtonPress2('right', rightDiceNumber);
                rightDiceNumber = returnValue;
              },
              child: Image.asset(
                './lib/assets/images/dice$rightDiceNumber.png',
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic reactToButtonPress1() {
    print('Hey Man the left button was pressed');
  }

  int reactToButtonPress2(String whichDie, int dieNum) {
    // Random number between 0 and 5 then add 1
    // to make newDieNum between 1 and 6 inclusive
    int newDieNum = Random().nextInt(6) + 1;
    print(
        '$whichDie button pressed. OLD $whichDie DiceNumber = $dieNum NEW $whichDie DiceNumber = $newDieNum');
    return newDieNum;
  }
}
