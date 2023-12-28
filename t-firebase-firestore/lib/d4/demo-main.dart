// ignore_for_file: use_key_in_widget_constructors, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

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

  void showSnack(SnackBar snackBar) {
    //print(scaffoldMessengerKey.currentState);
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  try {
                    await create();
                    showSnack(
                        MySnackBar(text: 'create: SUCCESS').get());
                  } catch (e) {
                    showSnack(MySnackBar(text: 'create: FAILED').get());
                  }
                },
                child: const Text("Create"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await read();
                    showSnack(
                        MySnackBar(text: 'read: SUCCESS').get());
                  } catch (e) {
                    showSnack(MySnackBar(text: 'read: FAILED').get());
                  }
                },
                child: const Text("Read"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await update();
                    showSnack(
                        MySnackBar(text: 'update: SUCCESS').get());
                  } catch (e) {
                    showSnack(MySnackBar(text: 'update: FAILED').get());
                  }
                },
                child: const Text("Update"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await delete();
                    showSnack(
                        MySnackBar(text: 'delete: SUCCESS').get());
                  } catch (e) {
                    showSnack(MySnackBar(text: 'delete: FAILED').get());
                  }
                },
                child: const Text("Delete"),
              ),
            ]),
      );
  }

  Future<void> create() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc('testUser').set({
        'firstName': 'test',
        'lastName': 'user',
      });
    } catch (e) {
      print('Database create: CATCH $e.toString');
      rethrow;
    }
  }

  Future<void> read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('testUser')
          .get();
      print(documentSnapshot.data());
    } catch (e) {
      print('Database read: CATCH $e.toString');
      rethrow;
    }
  }

  Future<void> update() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('testUser')
          .update({
        'firstName': 'testUpdated',
        'lastName': 'userUpdated',
      });
    } catch (e) {
      print('Database update: CATCH $e.toString');
      rethrow;
    }
  }

  Future<void> delete() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('testUser')
          .delete();
    } catch (e) {
      print('Database delete: CATCH $e.toString');
      rethrow;
    }
  }
}
