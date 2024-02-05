// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = 'Disabled';

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
                  // enabled is now DIRTY after next statement.
                  enabled = onChangedValue;
                  setState(() {
                    if (enabled) {
                      // Here we DO NOT reset the count.
                      // msg1 is now also DIRTY.
                      msg1 = 'Enabled';
                      print('enabled is true');
                    } else {
                      msg1 = 'Disabled';
                      // msg1 is now DIRTY.
                      print('enabled is false');
                    }
                  });
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //With an ElevatedButton whose onPressed = null
            //will give a greyed out disabled button, but
            //it will NOT disappear.
            //We can only achieve the disappearing nature
            //with a Visibility Widget, as 
            //second-page shows.
            ElevatedButton(
              onPressed: enabled
                  ? () {
                      setState(() {
                        timesClicked++;
                        msg1 = 'Clicked $timesClicked';
                        print('clicked $timesClicked');
                      });
                    }
                  : null,
              child: Text(msg1),
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
