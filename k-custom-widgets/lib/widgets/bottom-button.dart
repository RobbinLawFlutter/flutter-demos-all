// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.myText, this.onTap});

  final String myText;
  final void Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            myText,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
