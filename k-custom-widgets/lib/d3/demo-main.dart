// ignore_for_file: use_key_in_widget_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/constants.dart';

// This MyThirdPage demonstrates the use of 
// font awesome Icons from pub.dev.
// Go to pub.dev and search for font_awesome_flutter
// package and download and configure pubspec.yaml.


class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - Button-Disappear',
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
    return const Center();
  }
}
