// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

//Flutter 101: Stateful Widgets
//https://www.youtube.com/watch?v=AqCMFXEmf3w

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D2 - Stateful Widget DICE"),
      ),
      body: Dice(),
    );
  }
}

//The inheritance of this StatefulWidget is immutable.
//Unlike a stateless widget it does allow for the call to the
//createState method which instantiates a class that inherits from the
//State<> widget which is the mutable part.
class Dice extends StatefulWidget {
  // Because this part is immutable we must use final or const
  final int myInt = 2;
  @override
  State<Dice> createState() => DiceState();
}

class DiceState extends State<Dice> {
  //Here we can declare mutable class instance fields that can
  //be changed. With a stateless widget we could
  //only declare changeable fields (not marked final or const)
  //inside of the build method and then their scope would only be
  //inside of the build method.
  //These class instance fields are available only to any method
  //inside this class if they are private as here. 
  //The _ means that they are private, no keyword 'private' like in Csharp.
  //They would be accessible outside of this class if they were public with
  //no _ as the first letter of name.
  int _leftDiceNumber = 2;
  int _rightDiceNumber = 4;
  @override
  Widget build(BuildContext context) {
    print('The build method is being RUN');
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                
                int returnValue = reactToButtonPress('left', _leftDiceNumber);
                //When a field changes as here it is marked DIRTY.
                _leftDiceNumber = returnValue;
                
                //We can only use the 'setState' method if the parent class
                //is inherited from a STATE<> widget.
                //setState takes as a parm an anonymous function.
                setState(() {
                  //At the end of the setState anonymous function
                  //setState automatically triggers the nearest build method
                  //to rerun which in turn updates or rerenders the screen
                  //to reflect changes from any field/property 
                  //labeled DIRTY.
                });
              },
              // If _LeftDiceNumber becomes DIRTY this child
              // property of the TextButton will also be marked as DIRTY.
              child: Image.asset('./lib/assets/images/dice$_leftDiceNumber.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                setState(() {
                  //You can run statements inside of the 'setState
                  //anonymous function.
                  //At the end of the setState anonymous function
                  //setState automatically triggers the nearest build method
                  //to rerun which in turn updates or rerenders the screen
                  //to reflect changes from any field/property 
                  //labeled DIRTY.
                  int returnValue = reactToButtonPress('right', _rightDiceNumber);
                _rightDiceNumber = returnValue;
                });
              },
              child: Image.asset('./lib/assets/images/dice$_rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  int reactToButtonPress(String whichDie, int dieNum) {
    //Random number between 0 and 5 then add 1
    int newDieNum = Random().nextInt(6) + 1;
    print('$whichDie pressed. OLD ${whichDie}DieNum=$dieNum NEW ${whichDie}DieNum=$newDieNum');
    return newDieNum;
  }
  
}
