// ignore_for_file: use_key_in_widget_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robbinlaw/d9-TODO/services/authorization.dart';
import 'package:robbinlaw/d9-TODO/services/database.dart';
import 'package:robbinlaw/d9-TODO/widgets/mycard.dart';
import 'package:robbinlaw/d9-TODO/widgets/mysnackbar.dart';
import 'package:robbinlaw/d9-TODO/views/first.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bool useDissmissible = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Home build:');
    Authorization auth = Authorization();
    Database db = Database();
    return Scaffold(
      appBar: AppBar(
        title: Text('current user name: ${auth.currentUser?.displayName}'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                await auth.logOut();
                ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBar(text: 'logOut: SUCCESS').get());
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBar(text: 'logOut: FAILED').get());
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => First(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      try {
                        if (textEditingController.text != "") {
                          db.addAppData(textEditingController.text,
                              auth.currentUser!.uid);
                          textEditingController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              MySnackBar(text: 'add: SUCCESS').get());
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackBar(text: 'add: FAILED').get());
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          const Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          StreamBuilder(
              stream: db.streamOfAppData(auth.currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                print('home.StreamBuilder.builder ${snapshot.connectionState}');
                if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  print('Data: NO');
                  return const LinearProgressIndicator();
                }
                print('Data: YES');
                var listOfDocs = snapshot.data!.docs;
                return Expanded(
                  child: ListView.builder(
                      itemCount: listOfDocs.length,
                      itemBuilder: (BuildContext context, index) {
                        var doc = listOfDocs[index];
                        if (useDissmissible) {
                          return MyCardWithDismissible(
                            userId: auth.currentUser!.uid,
                            document: doc,
                          );
                        } else {
                          return MyCardWithSlidable(
                            userId: auth.currentUser!.uid,
                            document: doc,
                          );
                        }
                      }),
                );
              }),
        ],
      ),
    );
  }
}
