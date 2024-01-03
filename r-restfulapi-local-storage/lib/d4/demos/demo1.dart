// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo1'),
      ),
      body: MyDemo(),
    );
  }
}

class MyDemo extends StatefulWidget {
  @override
  MyDemoState createState() => MyDemoState();
}

class MyDemoState extends State<MyDemo> {
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
