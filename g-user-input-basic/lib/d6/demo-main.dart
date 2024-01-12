// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Page1'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Page2'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 3,
                child: ListTile(
                  leading: Icon(Icons.menu),
                  title: Text('Page3'),
                ),
              ),
            ],
            onCanceled: () {
              print("You have canceled the menu.");
            },
            onSelected: (value) {
              print("value: $value");
            },
          ),
        title: const Text('D6 - Dropdown Menu'),
      ),
      body: const Center(),
    );
  }
}