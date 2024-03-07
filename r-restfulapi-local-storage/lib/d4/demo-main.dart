// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';

// ListView Widget of the Week
// https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D4 - ListView',
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
  List<String> listItems = [];
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        listItems.add(textEditingController.text);
                        textEditingController.clear();
                        setState(() {});
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                title: Text(
                  listItems[index],
                  style: const TextStyle(
                    fontSize: 90,
                  ),
                ),
              ));
            },
          ),
        ),
      ],
    );
  }
}
