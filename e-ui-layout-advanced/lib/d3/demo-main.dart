// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

//using the Icon Widget
//go to http://www.materialpalette.com

//Icons from Material
//https://material.io/resources/icons/?style=baseline

//SizedBox Widget of the Week
//https://www.youtube.com/watch?v=EHPu_DzRfqA

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - Icon Widget',
        ),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('./assets/images/bottle.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'bottle pic',
                style: TextStyle(
                  fontFamily: 'Chilanka-Regular',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_alarm_sharp,
                        //Icons.add_shopping_cart,
                        size: 50,
                        color: Colors.blue.shade500,
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        'time to wake up',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
