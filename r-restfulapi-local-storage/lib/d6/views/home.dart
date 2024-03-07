// ignore_for_file: avoid_print, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:robbinlaw/d6/services/restapi.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final RestAPIService restAPIService = RestAPIService();
   Map<String, dynamic> data = {'content': ''};

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
                data = await restAPIService.getRestfulAPIData();
                setState(() {});
              } catch (e) {
                print('HomeView catch: $e');
              }
            },
          ),
          Text(data['content']),
        ],
      ),
    );
  }
}
