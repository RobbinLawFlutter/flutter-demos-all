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
        // The Align widget affects the
        // alignment of its child the container
        // relative to the Align parent,
        // the body of the Scaffold.
        //alignment: Alignment.bottomCenter,
        //alignment: Alignment.bottomLeft,
        //alignment: Alignment.topRight,
        //alignment: Alignment.centerLeft,
        //alignment: Alignment.center, //default
        child: Container(
          // We would expect this alignment to
          // move the image to the top right of
          // the container, but it does NOT.
          // If the containers child is an Align
          // widget, only its alignment parm will
          // effect its child which is the image.
          // Only if the containers child is the
          // image, will this alignment effect the
          // images alignment within the container.
          //alignment: Alignment.topRight,
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
            child: Image.asset('./lib/assets/images/bottle.jpg'),
          ),
        ),
      ),
    );
  }
}
