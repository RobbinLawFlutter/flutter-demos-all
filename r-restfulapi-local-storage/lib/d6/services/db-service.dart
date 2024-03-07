// ignore_for_file: avoid_print, library_prefixes, avoid_function_literals_in_foreach_calls

import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflitePackage;

class SQFliteDbService {
  late sqflitePackage.Database? db;
  late String path;

  Future<void> getOrCreateDatabaseHandle() async {
    try {
      var databasesPath = await sqflitePackage.getDatabasesPath();
      path = pathPackage.join(databasesPath, 'app_database.db');
      db = await sqflitePackage.openDatabase(
        path,
        onCreate: (sqflitePackage.Database db1, int version) async {
          await db1.execute(
            "CREATE TABLE AppData(city TEXT PRIMARY KEY, temperature INT, message TEXT, condition TEXT)",
          );
        },
        version: 1,
      );
      print('db = $db');
    } catch (e) {
      print('SQFliteDbService getOrCreateDatabaseHandle CATCH: $e');
    }
  }

  Future<void> printAllRecordsInDbToConsole() async {
    try {
      List<Map<String, dynamic>> listOfRecords = await getAllRecordsFromDb();
      if (listOfRecords.isEmpty) {
        print('No records in the db');
      } else {
        listOfRecords.forEach((item) {
          print(
              '{city: ${item['city']}, temp: ${item['temperature']}, message: ${item['message']}, condition: ${item['condition']}}');
        });
      }
    } catch (e) {
      print('SQFliteDbService printAllRecordsInDbToConsole CATCH: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getAllRecordsFromDb() async {
    try {
      final List<Map<String, dynamic>> listOfItems = await db!.query('AppData');
      return listOfItems;
    } catch (e) {
      print('SQFliteDbService getAllRecordsFromDb CATCH: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<void> deleteDb() async {
    try {
      await sqflitePackage.deleteDatabase(path);
      print('Db deleted');
      db = null;
    } catch (e) {
      print('SQFliteDbService deleteDb CATCH: $e');
    }
  }

  Future<void> insertRecord(Map<String, dynamic> record) async {
    try {
      await db!.insert(
        'AppData',
        record,
        conflictAlgorithm: sqflitePackage.ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('SQFliteDbService insertRecord CATCH: $e');
    }
  }

  Future<void> updateRecord(Map<String, dynamic> record) async {
    try {
      await db!.update(
        'AppData',
        record,
        where: "city = ?",
        // whereArg prevents SQL injection.
        whereArgs: [record['city']],
      );
    } catch (e) {
      print('SQFliteDbService updateRecord CATCH: $e');
    }
  }

  Future<void> deleteRecord(Map<String, dynamic> record) async {
    try {
      await db!.delete(
        'AppData',
        where: "city = ?",
        // whereArg to prevent SQL injection.
        whereArgs: [record['city']],
      );
    } catch (e) {
      print('SQFliteDbService deleteRecord CATCH: $e');
    }
  }
}
