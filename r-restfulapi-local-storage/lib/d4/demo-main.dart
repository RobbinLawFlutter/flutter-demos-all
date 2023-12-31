// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';

// ListView Widget of the Week
// https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en
 
class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D4 - ListView',
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
  List<String> listItems = [];
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: eCtrl,
          style: const TextStyle(
            fontSize: 60,
          ),
          onSubmitted: (text) {
            listItems.add(text);
            eCtrl.clear();
            setState(() {});
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                listItems[index],
                style: const TextStyle(
                  fontSize: 90,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}