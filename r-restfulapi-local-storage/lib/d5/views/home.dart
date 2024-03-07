// ignore_for_file: use_key_in_widget_constructors, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:robbinlaw/d5/services/db-service.dart';

//https://flutter.dev/docs/cookbook/persistence/sqlite

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final SQFliteDbService databaseService = SQFliteDbService();
  List<Map<String, dynamic>> listOfDogs = [];
  String dogName = "";

  @override
  void initState() {
    super.initState();
    getOrCreateDbAndDisplayAllDogsInDbToConsole();
  }

  void getOrCreateDbAndDisplayAllDogsInDbToConsole() async {
    await databaseService.getOrCreateDatabaseHandle();
    listOfDogs = await databaseService.getAllDogsFromDb();
    await printAllDogsInListToConsole(listOfDogs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text(
            'Delete Database',
          ),
          onPressed: () async {
            await databaseService.deleteDb();
            await databaseService.getOrCreateDatabaseHandle();
            listOfDogs = await databaseService.getAllDogsFromDb();
            await printAllDogsInListToConsole(listOfDogs);
            setState(() {});
          },
        ),
        ElevatedButton(
          child: const Text(
            'Add Dog',
          ),
          onPressed: () {
            addDogToDb();
          },
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listOfDogs.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: ListTile(
                    title: Text('name: ${listOfDogs[index]['name']}'),
                    subtitle: Text('id: ${listOfDogs[index]['id']}'),
                    trailing: Text('age: ${listOfDogs[index]['age']}'),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Future<void> printAllDogsInListToConsole(List<Map<String, dynamic>> listOfDogs) async {
    try {
      print('HomeView printAllDogsInListToConsole TRY');
      if (listOfDogs.isEmpty) {
        print('No Dogs in the list');
      } else {
        listOfDogs.forEach((dog) {
          print('Dog{id: ${dog['id']}, name: ${dog['name']}, age: ${dog['age']}}');
        });
      }
    } catch (e) {
      print('HomeView printAllDogsInDbToConsole CATCH: $e');
    }
  }

  Future<void> addDogToDb() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Input Dogs Name'),
          contentPadding: const EdgeInsets.all(5.0),
          content: TextField(
            decoration: const InputDecoration(
              hintText: "Dogs Name",
            ),
            onChanged: (String value) {
              dogName = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("AddDog"),
              onPressed: () async {
                Navigator.pop(context);
                if (dogName.isNotEmpty) {
                  print('User entered dogName: $dogName');
                  try {
                    await databaseService.insertDog(
                        {'id': listOfDogs.length, 'name': dogName, 'age': 5});
                    listOfDogs = await databaseService.getAllDogsFromDb();
                    await printAllDogsInListToConsole(listOfDogs);
                    setState(() {});
                  } catch (e) {
                    print('HomeView addDogToDb catch: $e');
                  }
                }
                dogName = "";
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
