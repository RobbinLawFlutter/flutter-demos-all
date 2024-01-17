// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

// Images Widget of the Week by the flutter team
// https://www.youtube.com/watch?v=7oIAs-0G4mw

// This app shows how to display a network image,
// and an asset image.
// In order to do this the images have to be
// in a "images" folder in the project
// and pubspec.yaml has to be changed to expose them.
// Note that the relative path to the image
// starts relative to where the pubspec.yaml
// file is, not this demo-main.dart file.

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D2 - Images"),
      ),
      body: Column(
        children: [
        Image.asset('./lib/assets/images/bottle.jpg'),
        Image.network('https://www.w3schools.com/w3css/img_snowtops.jpg'),
        const Text('hi there'),
      ]),
    );
  }
}
