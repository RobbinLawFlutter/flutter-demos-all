// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

// Visibility Widget by Al with Flutter
// https://www.youtube.com/watch?v=FS5JQpp2gks

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';

  @override
  Widget build(BuildContext context) {
    print('The build method is being RUN');
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enable Button'),
            Switch(
                value: enabled,
                onChanged: (bool onChangedValue) {
                  print('onChangedValue is $onChangedValue');
                  enabled = onChangedValue;
                  setState(() {
                    if (enabled) {
                      // Here we DO reset the count
                      // unlike the previous demo.
                      timesClicked = 0;
                      msg1 = 'Enabled';
                      print('enabled is true');
                    } else {
                      msg1 = 'Disabled';
                      print('enabled is false');
                    }
                  });
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Here we use a Visibility Widget to
            // show or hide the button based on
            // the value of the switch.
            Visibility(
              visible: enabled,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    timesClicked++;
                    msg1 = 'Clicked $timesClicked';
                    print('clicked $timesClicked');
                  });
                },
                child: Text(msg1),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hey This Is Fun'),
          ],
        )
      ],
    );
  }
}
