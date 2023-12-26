// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';

// https://api.flutter.dev/flutter/material/material-library.html

// Snackbar Widget of the Week.
// https://www.youtube.com/watch?v=zpO6n_oZWw0

// SnackBar
// https://api.flutter.dev/flutter/material/SnackBar-class.html

// ScaffoldMessenger Widget of the Week
// https://youtu.be/lytQi-slT5Y

// Proper use of the ScaffoldMessenger.of
// https://docs.flutter.dev/release/breaking-changes/scaffold-messenger

// https://flutterdesk.com/how-to-show-custom-snackbar-in-flutter/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Snackbar Demo',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
      theme: buildTheme(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Snackbar Demo'),
      ),
      body: Center(
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
                dynamic snackBar = mySnackBar('hey man');
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Respond to button press
                print('You Clicked the Elevated Button');
              },
              child: const Text("SHOW SNACKBAR"),
            ),
            SnackbarButton(),
          ],
        ),
      ),
    );
  }

  SnackBar mySnackBar(String text) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(Icons.accessibility_new_rounded),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
      action: SnackBarAction(
        label: 'Click Me',
        onPressed: () {
          print('hey you clicked on the snackbar Action');
        },
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // building the snackBar
        dynamic snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          //behavior: SnackBarBehavior.fixed,
          //duration: const Duration(seconds: 10),
          content: const Row(
            children: [
              Icon(Icons.favorite),
              SizedBox(
                width: 10,
              ),
              Text('Hey There'),
            ],
          ),
          action: SnackBarAction(
            label: 'Click Me',
            onPressed: () {
              print('hey you clicked on the snackbar Action');
            },
          ),
        );
        // Displaying the snackBar.
        // Find the Scaffold in the
        // widget tree and use
        // it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('SHOW SNACKBAR'),
    );
  }
}
