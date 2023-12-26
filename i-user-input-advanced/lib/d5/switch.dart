// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: buildTheme(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<bool> _values = [true, false, true, false, false];

  @override
  Widget build(BuildContext context) {
    int count = 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Demo'),
      ),
      body: Column(
        children: <Widget>[
          for (int i = 0; i <= count; i++)
            ListTile(
              title: Text(
                'Switch $i',
              ),
              leading: Switch(
                value: _values[i],
                // Making the onChanged property null disables the switch.
                onChanged: i == count - 1
                    ? null
                    : (bool value) {
                        _values[i] = value;
                        print(_values);
                        setState(() {});
                      },
              ),
            ),
        ],
      ),
    );
  }
}
