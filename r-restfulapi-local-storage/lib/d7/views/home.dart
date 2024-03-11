// ignore_for_file: avoid_print, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:robbinlaw/d7/services/restapi.dart';
import 'package:robbinlaw/d7/services/db-service.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final RestAPIService restAPIService = RestAPIService();
  final SQFliteDbService databaseService = SQFliteDbService();
  List<Map<String, dynamic>> listOfRecords = [];
  String citySymbol = "";
  late String weatherDescription;
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    print('HomeView initState begin');
    super.initState();
    getOrCreateDbAndDisplayAllRecordsInDb();
  }

  void getOrCreateDbAndDisplayAllRecordsInDb() async {
    print('HomeView getOrCreateDbAndDisplayAllRecordsInDb() begin');
    await databaseService.getOrCreateDatabaseHandle();
    listOfRecords = await databaseService.getAllRecordsFromDb();
    await databaseService.printAllRecordsInDbToConsole();
    print('HomeView getOrCreateDbAndDisplayAllRecordsInDb() end');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('HomeView build begin');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text(
            'Delete All Records and Db',
          ),
          onPressed: () async {
            await databaseService.deleteDb();
            await databaseService.getOrCreateDatabaseHandle();
            listOfRecords = await databaseService.getAllRecordsFromDb();
            await databaseService.printAllRecordsInDbToConsole();
            setState(() {});
          },
        ),
        ElevatedButton(
          child: const Text(
            'Add City Weather',
          ),
          onPressed: () {
            inputCity();
          },
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listOfRecords.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      '${listOfRecords[index]['city']}: ${listOfRecords[index]['temperature']} degC',
                      style: const TextStyle(fontSize: 30),
                    ),
                    subtitle: Text(
                      '${listOfRecords[index]['message']} ',
                      style: const TextStyle(fontSize: 25),
                    ),
                    trailing: Text(
                      '${listOfRecords[index]['condition']} ',
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Future<void> inputCity() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Input City Name'),
            contentPadding: const EdgeInsets.all(5.0),
            content: TextField(
              decoration: const InputDecoration(hintText: "City Name"),
              onChanged: (String value) {
                citySymbol = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Add City"),
                onPressed: () async {
                  if (citySymbol.isNotEmpty) {
                    print('User entered City: $citySymbol');
                    try {
                      var data =
                          await restAPIService.getRestfulAPIData(citySymbol);
                      if (data == null) {
                        print(
                            "Call to getRestfulAPIData failed to return data");
                      } else {
                        updateUI(data);
                        await databaseService.insertRecord({
                          'city': cityName,
                          'temperature': temperature,
                          'message': weatherMessage,
                          'condition': weatherIcon
                        });
                        listOfRecords =
                            await databaseService.getAllRecordsFromDb();
                        databaseService.printAllRecordsInDbToConsole();
                        setState(() {});
                      }
                    } catch (e) {
                      print('HomeView inputCity catch: $e');
                    }
                  }
                  citySymbol = "";
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      return;
    }
    weatherDescription = weatherData['weather'][0]['description'];
    print('Weather Description: $weatherDescription');
    double temp = weatherData['main']['temp'];
    //temperature = temp;
    temperature = temp.toInt();
    print('Temperature: $temperature degC');
    int condition = weatherData['weather'][0]['id'];
    print('Current Condition: $condition');
    weatherIcon = restAPIService.getWeatherIcon(condition);
    cityName = weatherData['name'];
    print('City Name: $cityName');
    weatherMessage = restAPIService.getMessage(temperature);
    print(weatherMessage);
  }
}
