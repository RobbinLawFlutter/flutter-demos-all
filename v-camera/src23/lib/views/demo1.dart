// ignore_for_file: file_names, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Demo1 extends StatefulWidget {
  @override
  Demo1State createState() => Demo1State();
}

class Demo1State extends State<Demo1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              print('about to take pic');
            },
            child: const Text('Get Location'),
          ),
          const SpinKitDoubleBounce(
            color: Colors.white,
            size: 100,
          ),
        ],
      ),
    );
  }
}
