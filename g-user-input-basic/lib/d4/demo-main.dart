// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D4 - AppBar Button',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              dynamic snackBar = newMethod();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            //child: Text('Show SnackBar'),
            child: const Icon(Icons.shopping_bag),
          ),
          SnackbarButton(),
        ],
      ),
      body: const Center(),
    );
  }

  SnackBar newMethod() {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: const Row(
        children: [
          Icon(Icons.accessibility_new_rounded),
          SizedBox(
            width: 10,
          ),
          Text('Hey There Robbin'),
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
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Row(
            children: [
              Icon(Icons.access_alarm),
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

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      //child: Text('Show SnackBar'),
      child: const Icon(Icons.favorite),
    );
  }
}
