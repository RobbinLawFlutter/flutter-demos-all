// ignore_for_file: avoid_print, library_prefixes, file_names

import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflitePackage;
import 'package:robbinlaw/d5/models/dog.dart';

// https://pub.dev/packages/sqflite

// https://flutter.dev/docs/cookbook/persistence/sqlite

// sqflite package of the week.
// https://www.youtube.com/watch?v=HefHf5B1YM0&vl=en

// sql injection attack
// https://stackoverflow.com/questions/48828839/android-sqlite-update-why-whereargs

class SQFliteDbService {
  late sqflitePackage.Database? db;
  late String path;

  Future<void> getOrCreateDatabaseHandle() async {
    try {
      print('SQFliteDbService getOrCreateDatabaseHandle TRY');
      var databasesPath = await sqflitePackage.getDatabasesPath();
      path = pathPackage.join(databasesPath, 'doggie_database.db');
      db = await sqflitePackage.openDatabase(
        path,
        onCreate: (sqflitePackage.Database db1, int version) async {
          await db1.execute(
            "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
          );
        },
        version: 1,
      );
      print('$db');
    } catch (e) {
      print('SQFliteDbService getOrCreateDatabaseHandle CATCH: $e');
    }
  }

  Future<void> deleteDb() async {
    try {
      print('SQFliteDbService deleteDb TRY');
      await sqflitePackage.deleteDatabase(path);
      db = null;
    } catch (e) {
      print('SQFliteDbService deleteDb CATCH: $e');
    }
  }
  
  Future<List<Dog>> getAllDogsFromDb() async {
    try {
      print('SQFliteDbService getAllDogsFromDb TRY');
      // Query the table for all The Dogs.
      //The .query will return a list with each item in the list being a map.
      final List<Map<String, dynamic>> dogMap = await db!.query('dogs');
      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(dogMap.length, (i) {
        return Dog(
          id: dogMap[i]['id'],
          name: dogMap[i]['name'],
          age: dogMap[i]['age'],
        );
      });
    } catch (e) {
      print('SQFliteDbService getAllDogsFromDb CATCH: $e');
      return <Dog>[];
    }
  }

  Future<void> insertDog(Dog dog) async {
    try {
      print('SQFliteDbService insertDog TRY');
      // Insert the Dog into the correct table. Also specify the
      // `conflictAlgorithm`. In this case, if the same dog is inserted
      // multiple times, it replaces the previous data.
      await db!.insert(
        'dogs',
        dog.toMap(),
        //conflictAlgorithm: sqflitePackage.ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('SQFliteDbService insertDog CATCH: $e');
    }
  }

  Future<void> updateDog(Dog dog) async {
    try {
      print('SQFliteDbService updateDog TRY');
      // Update the given Dog.
      await db!.update(
        'dogs',
        dog.toMap(),
        // Ensure that the Dog has a matching id.
        where: "id = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [dog.id],
      );
    } catch (e) {
      print('SQFliteDbService updateDog CATCH: $e');
    }
  }

  Future<void> deleteDog(Dog dog) async {
    try {
      print('SQFliteDbService deleteDog TRY');
      // Remove the Dog from the database.
      await db!.delete(
        'dogs',
        // Use a `where` clause to delete a specific dog.
        where: "id = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [dog.id],
      );
    } catch (e) {
      print('SQFliteDbService deleteDog CATCH: $e');
    }
  }
}
