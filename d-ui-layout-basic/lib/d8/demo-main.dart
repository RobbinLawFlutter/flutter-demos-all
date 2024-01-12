// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

// Expanded Widget of the Week by the flutter team
// https://www.youtube.com/watch?v=_rnZaagadyo

// Expanded Widget by RetroStudio
// https://www.youtube.com/watch?v=a-jbBVAB5o0&list=PLybADvIp2cxiVOEHi9ooCHP2tAAihHQPX&index=12

// We can use the Expanded Widget with the 
// Padding Widget and the Container Widget
// to stretch the Container Widgets 
// as per the flex value.

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D8 - Expanded Widget',
        ),
      ),
      body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                  ),
                  child: const Image(
                    image: AssetImage('./lib/assets/images/bottle.jpg'),
                  ),
                ),
              ),
            ),
            Container(
              height: 100.0,
              width: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.cyan,
              ),
              child: const Image(
                image: AssetImage('./lib/assets/images/bottle.jpg'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.yellow,
                  ),
                  child: Image.asset('./lib/assets/images/bottle.jpg'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.green,
                  ),
                  child: Image.asset('./lib/assets/images/bottle.jpg'),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
