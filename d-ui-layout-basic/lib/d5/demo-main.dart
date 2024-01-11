// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

// Align Widget of the Week by the flutter team
// https://www.youtube.com/watch?v=g2E7yl3MwMk

// Align Widget by RetroStudio
// https://www.youtube.com/watch?v=7Dljvr-Afvc&list=PLybADvIp2cxiVOEHi9ooCHP2tAAihHQPX&index=11

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D5 - Align Widget',
        ),
      ),
      body: Align(
        //alignment: Alignment.bottomCenter,
        //alignment: Alignment.bottomLeft,
        //alignment: Alignment.topRight,
        //alignment: Alignment.centerLeft,
        //alignment: Alignment.center, //default
        child: Container(
          height: 400.0,
          width: 340.0,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.amber,
          ),
          child: Align(
            //alignment: Alignment.bottomCenter,
            //alignment: Alignment.bottomLeft,
            //alignment: Alignment.topRight,
            //alignment: Alignment.centerLeft,
            //alignment: Alignment.center, //default
            child: Image.asset('./assets/images/bottle.jpg'),
          ),
        ),
      ),
    );
  }
}
