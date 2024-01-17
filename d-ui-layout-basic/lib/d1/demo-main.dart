// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

// Here we create our own class called "Demo".
// The extends key word means that we are inheriting
// from the StatelessWidget class. 
// Inheritance is a pillar of OOP.
// The @override keyword means that we are changing
// the base classes build method to our own.
// Polymorphism is another pillar of OOP.
// This will return our produced Widget.

//stateless Widget from Widgets 101 series by the flutter team. Just up to minute 4:07.
//https://www.youtube.com/watch?v=wE7khGHVkYY

//center widget by RetroStudio
//https://www.youtube.com/watch?v=c726pWTtxqI&list=PLybADvIp2cxiVOEHi9ooCHP2tAAihHQPX&index=2

//text widget with style by RetroStudio: Just up to minute 4.
//https://www.youtube.com/watch?v=96Gb-YHQdmY&list=PLybADvIp2cxiVOEHi9ooCHP2tAAihHQPX&index=9

//https://flutter.dev/docs/development/ui/layout

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'D1 - StatelessWidget',
        ),
      ),
      body: Center(
          child: Text(
            'Hey Man this is fun',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              backgroundColor: Colors.black,
              decoration: TextDecoration.combine([
                TextDecoration.underline,
                TextDecoration.overline,
              ]),
            ),
          ),
        ),
    );
  }
}
