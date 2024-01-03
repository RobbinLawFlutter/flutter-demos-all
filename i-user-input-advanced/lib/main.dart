// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';
// D1 - Switch Widget
import 'package:robbinlaw/d1/demo-main.dart' as d1;
// D2 - Switch-Button Enable
import 'package:robbinlaw/d2/demo-main.dart' as d2;
// D3 - Button-Disappear
import 'package:robbinlaw/d3/demo-main.dart' as d3;
// D4 - Text Forms
import 'package:robbinlaw/d4/demo-main.dart' as d4;
// D5 - 
import 'package:robbinlaw/d5/demo-main.dart' as d5;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
      theme: buildTheme(),
    );
  }
}

class Root extends StatefulWidget {
  @override
  State<Root> createState() => RootState();
}

class RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              value: 1,
              child: ListTile(
                title: Text('D1 - Switch'),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 2,
              child: ListTile(
                title: Text('D2 - Switch-Button'),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 3,
              child: ListTile(
                title: Text('D3 - Button-Gone'),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 4,
              child: ListTile(
                title: Text('D4 - Text-Forms'),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 5,
              child: ListTile(
                title: Text('D5 - '),
              ),
            ),
          ],
          onCanceled: () {
            print("You have canceled the menu.");
          },
          onSelected: (value) {
            if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => d1.Demo(),
                ),
              );
            }
            if (value == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => d2.Demo(),
                ),
              );
            }
            if (value == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => d3.Demo(),
                ),
              );
            }
            if (value == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => d4.Demo(),
                ),
              );
            }
            if (value == 5) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => d5.Demo(),
                ),
              );
            }
          },
        ),
        title: const Text('User Input Advanced'),
      ),
      body: const Center(),
    );
  }
}
