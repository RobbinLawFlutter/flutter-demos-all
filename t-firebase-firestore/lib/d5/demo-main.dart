// ignore_for_file: use_key_in_widget_constructors, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D5 - FireStore-Name-Votes',
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
    return Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('baby')
                .snapshots(),
            builder: (context, snapshot) {
              print('demo2 StreamBuilder builder');
              if (snapshot.data == null) {
                print('no data yet');
                return const LinearProgressIndicator();
              }
              print('yes data');
              var listOfDocs = snapshot.data!.docs;
              return Expanded(
                child: ListView.builder(
                    itemCount: listOfDocs.length,
                    itemBuilder: (BuildContext context, index) {
                      var doc = listOfDocs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ListTile(
                              title: Text(doc.data()['name']),
                              trailing:
                                  Text(doc.data()['votes'].toString()),
                              onTap: () {
                                doc.reference.update({
                                  'votes': FieldValue.increment(1)
                                });
                              }),
                        ),
                      );
                    }),
              );
            },
          ),
        ],
      );
  }
}
