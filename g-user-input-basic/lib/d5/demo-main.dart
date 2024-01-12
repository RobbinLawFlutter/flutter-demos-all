// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/d5/views/view0.dart';

//Push and Pop Navigation Basics
//https://flutter.dev/docs/cookbook/navigation/navigation-basics

//Push and Pop from flutter community.
//https://medium.com/flutter-community/flutter-push-pop-push-1bb718b13c31

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - Navigation',
        ),
      ),
      body: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //Navigate to View 0
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => View0(),
            ),
          );
        },
        child: const Text(
          'Start',
        ),
      ),
    );
  }
}
