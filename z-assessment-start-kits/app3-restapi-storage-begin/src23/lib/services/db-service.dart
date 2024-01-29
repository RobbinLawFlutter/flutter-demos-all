// ignore_for_file: todo, avoid_print, library_prefixes, avoid_function_literals_in_foreach_calls, file_names

import 'package:path/path.dart' as pathPackage;
import 'package:sqflite/sqflite.dart' as sqflitePackage;
import '../models/stock.dart';

class SQFliteDbService {
  late sqflitePackage.Database db;
  late String path;

  Future<void> getOrCreateDatabaseHandle() async {
    try {
      var databasesPath = await sqflitePackage.getDatabasesPath();
      path = pathPackage.join(databasesPath, 'stocks_database.db');
      db = await sqflitePackage.openDatabase(
        path,
        onCreate: (sqflitePackage.Database db1, int version) async {
          await db1.execute(
            "CREATE TABLE stocks(symbol TEXT PRIMARY KEY, name TEXT, price TEXT)",
          );
        },
        version: 1,
      );
      print('db = $db');
    } catch (e) {
      print('SQFliteDbService getOrCreateDatabaseHandle: $e');
    }
  }

  Future<void> printAllStocksInDbToConsole() async {
    try {
      List<Stock> listOfStocks = await getAllStocksFromDb();
      if (listOfStocks.isEmpty) {
        print('No Stocks in the list');
      } else {
        listOfStocks.forEach((stock) {
          print(
              'Stock{symbol: ${stock.symbol}, name: ${stock.name}, price: ${stock.price}}');
        });
      }
    } catch (e) {
      print('SQFliteDbService printAllStocksInDbToConsole: $e');
    }
  }

  Future<List<Stock>> getAllStocksFromDb() async {
    try {
      // Query the table for all The Stocks.
      //The .query will return a list with each item in the list being a map.
      final List<Map<String, dynamic>> stockMap = await db.query('stocks');
      // Convert the List<Map<String, dynamic> into a List<Stock>.
      return List.generate(stockMap.length, (i) {
        return Stock(
          symbol: stockMap[i]['symbol'],
          name: stockMap[i]['name'],
          price: stockMap[i]['price'],
        );
      });
    } catch (e) {
      print('SQFliteDbService getAllStocksFromDb: $e');
      return [];
    }
  }

  Future<void> deleteDb() async {
    try {
      await sqflitePackage.deleteDatabase(path);
      print('Db deleted');
    } catch (e) {
      print('SQFliteDbService deleteDb: $e');
    }
  }

  Future<void> insertStock(Stock stock) async {
    try {
      //TODO: 
      //Put code here to insert a stock into the database.
      //Insert the Stock into the correct table. 
      //Also specify the conflictAlgorithm. 
      //In this case, if the same stock is inserted
      //multiple times, it replaces the previous data.
    
    } catch (e) {
      print('SQFliteDbService insertStock: $e');
    }
  }

  Future<void> updateStock(Stock stock) async {
    try {
      //TODO: 
      //Put code here to update stock info.
      
    } catch (e) {
      print('SQFliteDbService updateStock: $e');
    }
  }

  Future<void> deleteStock(Stock stock) async {
    try {
      //TODO: 
      //Put code here to delete a stock from the database.
      
    } catch (e) {
      print('SQFliteDbService deleteStock: $e');
    }
  }
}
