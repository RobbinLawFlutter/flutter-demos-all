// ignore_for_file: avoid_print, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:robbinlaw/d6/services/restapi.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final RestAPIService restAPIService = RestAPIService();

  @override
  Widget build(BuildContext context) {
    print('HomeView build begin');
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text(
              'Get Random Quote',
            ),
            onPressed: () async {
              try {
                var data = await restAPIService.getData();
                if (data == null) {
                  print("Call to getData failed to return data");
                } else {
                  print(data);
                  //updateUI(data);
                  setState(() {});
                }
              } catch (e) {
                print('HomeView catch: $e');
              }
              //setState(() {});
            },
          ),
        ],
      ),
    );
  }
}