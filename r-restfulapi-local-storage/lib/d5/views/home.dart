// ignore_for_file: use_key_in_widget_constructors, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:robbinlaw/d5/services/db-service.dart';
import 'package:robbinlaw/d5/models/dog.dart';
import 'package:robbinlaw/d5/models/dog_list.dart';

//https://flutter.dev/docs/cookbook/persistence/sqlite

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final SQFliteDbService _databaseService = SQFliteDbService();
  List<Dog> _dogList = [];
  List<Map<String, dynamic>> listOfDogs = [];
  String _dogName = "";

  @override
  void initState() {
    super.initState();
    getOrCreateDbAndDisplayAllDogsInDbToConsole();
  }

  void getOrCreateDbAndDisplayAllDogsInDbToConsole() async {
    await _databaseService.getOrCreateDatabaseHandle();
    _dogList = await _databaseService.getAllDogsFromDb1();
    listOfDogs = await _databaseService.getAllDogsFromDb();
    await printAllDogsInListToConsole1(_dogList);
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
            await _databaseService.deleteDb();
            await _databaseService.getOrCreateDatabaseHandle();
            _dogList = await _databaseService.getAllDogsFromDb1();
            listOfDogs = await _databaseService.getAllDogsFromDb();
            await printAllDogsInListToConsole1(_dogList);
            await printAllDogsInListToConsole(listOfDogs);
            setState(() {});
          },
        ),
        ElevatedButton(
          child: const Text(
            'Add Dog',
          ),
          onPressed: () {
            _addDogToDb();
          },
        ),
        Expanded(
          child: DogList(dogs: _dogList),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _dogList.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: ListTile(
                    title: Text('name: ${_dogList[index].name}'),
                    subtitle: Text('id: ${_dogList[index].id}'),
                    trailing: Text('age: ${_dogList[index].age}'),
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

  Future<void> printAllDogsInListToConsole1(List<Dog> listOfDogs) async {
    try {
      print('HomeView printAllDogsInListToConsole TRY');
      if (listOfDogs.isEmpty) {
        print('No Dogs in the list');
      } else {
        listOfDogs.forEach((dog) {
          print('Dog{id: ${dog.id}, name: ${dog.name}, age: ${dog.age}}');
        });
      }
    } catch (e) {
      print('HomeView printAllDogsInDbToConsole CATCH: $e');
    }
  }

  Future<void> _addDogToDb() async {
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
              _dogName = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("AddDog"),
              onPressed: () async {
                Navigator.pop(context);
                if (_dogName.isNotEmpty) {
                  print('User entered dogName: $_dogName');
                  try {
                    await _databaseService.insertDog1(
                        Dog(id: _dogList.length, name: _dogName, age: 5));
                    await _databaseService.insertDog(
                        Dog(id: _dogList.length, name: _dogName, age: 5));
                    _dogList = await _databaseService.getAllDogsFromDb1();
                    listOfDogs = await _databaseService.getAllDogsFromDb();
                    await printAllDogsInListToConsole1(_dogList);
                    await printAllDogsInListToConsole(listOfDogs);
                    setState(() {});
                  } catch (e) {
                    print('HomeView _addDogToDb catch: $e');
                  }
                }
                _dogName = "";
                //Navigator.pop(context);
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
