// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// runApp function sets up the initial settings 
// for the app and defines which is the root 
// widget of the application.
// The framework forces the root widget 
// to cover all the screen.
// Our root widget is the MaterialApp widget.
// The word "widget" refers to any object that
// shows on the screen, or helps to show objects
// on the screen.

// material component widgets
// https://flutter.dev/docs/development/ui/widgets/material

//This version of the code is hard to read
//as there are no , after each ) at the end
void main() {
  runApp(
      MaterialApp(home: Scaffold(body: Center(child: Text('Hello World!')))));
}

//This version of the code is easy to read
//as there are , after each ) and if we right mouse
//and choose Format Document we get this result
/*
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!',
          ),
        ),
      ),
    ),
  );
}
*/
