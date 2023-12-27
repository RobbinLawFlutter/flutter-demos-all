// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
