// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

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
              MySnackBar(text: 'Hey Man').show();
            },
            child: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: const Center(),
    );
  }
}