// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ReuseableCardEnhanced extends StatelessWidget {
  const ReuseableCardEnhanced({required this.myColor, this.reusableCardChild, this.onPress});
  // constructor that requires a Color parameter,
  // and an optional reusableCardChild widget and onPress Function.

  final Color myColor;
  // final makes this property called myColor
  //of type Color immutable, cannot change once set.

  final Widget? reusableCardChild;

  //This parm is itself a function.
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: reusableCardChild,
      ),
    );
  }
}
