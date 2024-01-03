// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// https://api.flutter.dev/flutter/material/material-library.html

// Snackbar Widget of the Week.
// https://www.youtube.com/watch?v=zpO6n_oZWw0

// SnackBar
// https://api.flutter.dev/flutter/material/SnackBar-class.html

// ScaffoldMessenger Widget of the Week
// https://youtu.be/lytQi-slT5Y

// https://flutterdesk.com/how-to-show-custom-snackbar-in-flutter/

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - Buttons/Snackbar',
        ),
      ),
      body: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // Respond to button press
              print('You Clicked the Text Button');
            },
            child: const Text(
              'TEXT BUTTON',
              //style: TextStyle(color: Colors.green),
            ),
          ),
          const SizedBox(height: 8.0),
          OutlinedButton(
            onPressed: () {
              // Respond to button press
              print('You Clicked the Outlined Button');
            },
            child: const Text("OUTLINED BUTTON"),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Respond to button press
              print('You Clicked the Elevated Button');
            },
            child: const Text("ELEVATED BUTTON"),
          ),
          ElevatedButton(
            onPressed: () {
              MySnackBar(text: 'Hey Man').show();
              print('You printed a Snackbar');
            },
            child: const Text("SHOW SNACKBAR"),
          ),
          
        ],
      ),
    );
  }
}