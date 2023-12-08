// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

// Visibility Widget by Al with Flutter
// https://www.youtube.com/watch?v=FS5JQpp2gks

class MySecondPage extends StatefulWidget {
  @override
  MySecondPageState createState() => MySecondPageState();
}

class MySecondPageState extends State<MySecondPage> {
  bool _enabled = false;
  int _timesClicked = 0;
  String _msg1 = '';

  @override
  Widget build(BuildContext context) {
    print('The build method is being RUN');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disappearing Button Demo'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Enable Button'),
              Switch(
                  value: _enabled,
                  onChanged: (bool onChangedValue) {
                    print('onChangedValue is $onChangedValue');
                    _enabled = onChangedValue;
                    setState(() {
                      if (_enabled) {
                        // Here we DO reset the count 
                        // unlike the previous demo.
                        _timesClicked = 0;
                        _msg1 = 'Enabled';
                        print('_enabled is true');
                      } else {
                        _msg1 = 'Disabled';
                        print('_enabled is false');
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
                visible: _enabled,
                child: ElevatedButton(
                  onPressed: () {
                          setState(() {
                            _timesClicked++;
                            _msg1 = 'Clicked $_timesClicked';
                            print('clicked $_timesClicked');
                          });
                        },
                  child: Text(_msg1),
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
      ),
    );
  }
}
