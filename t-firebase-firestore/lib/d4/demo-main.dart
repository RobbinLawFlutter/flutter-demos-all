// ignore_for_file: use_key_in_widget_constructors, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/d4/services/database.dart';

//Intro to FireStore from Google Futter in Focus series
//https://www.youtube.com/watch?v=DqJ_KjFzL9I&t=7s

//What is a nosql database... 12 videos about FireStore
//https://www.youtube.com/watch?v=v_hR4K4auoQ&list=PLl-K7zZEsYLluG5MCVEzXAQ7ACZBCuZgZ

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D4 - FireStore-Basics',
        ),
      ),
      body: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await Database().create();
              },
              child: const Text("Create"),
            ),
            ElevatedButton(
              onPressed: () async {
                await Database().read();
              },
              child: const Text("Read"),
            ),
            ElevatedButton(
              onPressed: () async {
                await Database().update();
              },
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: () async {
                await Database().delete();
              },
              child: const Text("Delete"),
            ),
          ]),
    );
  }
}
