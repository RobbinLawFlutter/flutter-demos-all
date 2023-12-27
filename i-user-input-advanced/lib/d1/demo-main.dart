// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D1 - Switch Widget',
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
  List<bool> values = [true, false, true, false, false];

  @override
  Widget build(BuildContext context) {
    int count = 4;

    return Column(
      children: <Widget>[
        for (int i = 0; i <= count; i++)
          ListTile(
            title: Text(
              'Switch $i',
            ),
            leading: Switch(
              value: values[i],
              // Making the onChanged property null disables the switch.
              onChanged: i == count - 1
                  ? null
                  : (bool value) {
                      values[i] = value;
                      print(values);
                      setState(() {});
                    },
            ),
          ),
      ],
    );
  }
}
