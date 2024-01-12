// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

//custom font text by RetroStudio: After minute 4.
//https://www.youtube.com/watch?v=96Gb-YHQdmY&list=PLybADvIp2cxiVOEHi9ooCHP2tAAihHQPX&index=9

//Using Avatar Widgets & Manipulating Text Properties
//Also loading custom fonts
//google fonts.google.com download the font you want and unzip
//in my case Chilanka-Regular
//create a directory called "fonts" and drag and drop
//the ttf file to the new directory
//now edit pubspec.yaml to add the font same way as images

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D2 - Custom Fonts"),
      ),
      body: const Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 150,
                //backgroundColor: Colors.amber,
                backgroundImage: AssetImage('./lib/assets/images/bottle.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'bottle pic',
                style: TextStyle(
                    fontFamily: 'Chilanka-Regular',
                    fontSize: 60,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontWeight: FontWeight.normal,
                    letterSpacing: 10.5,
                    wordSpacing: 5),
              ),
            ),
          ],
        ),
    );
  }
}
