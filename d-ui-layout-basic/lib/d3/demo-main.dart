// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

// Container Widget of the Week from the flutter team
// https://www.youtube.com/watch?v=c1xLMaTUWCY&vl=en

// container widget from RetroPortal
// https://www.youtube.com/watch?v=fvtyGySLlfs&list=PLybADvIp2cxiVOEHi9ooCHP2tAAihHQPX&index=3

// boxdecoration cheat sheet
// https://medium.com/jlouage/flutter-boxdecoration-cheat-sheet-72cedaa1ba20

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - Containers',
        ),
      ),
      // By default the container will be placed
      // in the top left of its parent, the body of the scaffold.
      body: Container(
        // If you do not specify a height and width the 
        // container will size to its child.

        height: 400.0,
        width: 340.0,
        // Default color is the color of the containers parent,
        // the scaffold.
        // You cannot provide both a color and decoration
        // at the same time.

        //color: Colors.white,
        //padding: const EdgeInsets.fromLTRB(50, 40, 10, 20),
        //padding: const EdgeInsets.all(100.0),
        //margin: const EdgeInsets.fromLTRB(50.0, 40.0, 10.0, 20.0),
        //margin: const EdgeInsets.all(100.0),
        //margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),

        // Align the child within the container, default is center.

        //alignment: Alignment.bottomCenter,
        //alignment: Alignment.centerRight,
        alignment: Alignment.topLeft,

        // You can decorate the container to change its shape and
        // give it a border and color.
        decoration: BoxDecoration(
          // Change the shape of the container, default is rectangle.
          shape: BoxShape.rectangle,
          // If you use the decoration property
          // you can only change the color here, not
          // in the color prop of the container.
          color: Colors.amber,
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Image.asset('./lib/assets/images/bottle.jpg'),
      ),
    );
  }
}
