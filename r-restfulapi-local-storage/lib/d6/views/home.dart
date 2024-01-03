// ignore_for_file: avoid_print, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:robbinlaw/d6/models/model-element-list.dart';
import 'package:robbinlaw/d6/models/model-element.dart';
import 'package:robbinlaw/d6/services/weather.dart';
import 'package:robbinlaw/d6/services/db-service.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final WeatherService _weatherService = WeatherService();
  final SQFliteDbService _databaseService = SQFliteDbService();
  List<ModelElement> _list = [];
  String _citySymbol = "";
  late String weatherDescription;
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    print('HomeView initState begin');
    super.initState();
    getOrCreateDbAndDisplayAllStocksInDb();
  }

  void getOrCreateDbAndDisplayAllStocksInDb() async {
    print('HomeView getOrCreateDbAndDisplayAllStocksInDb() begin');
    await _databaseService.getOrCreateDatabaseHandle();
    _list = await _databaseService.getAllRecordsFromDb();
    await _databaseService.printAllRecordsInDbToConsole();
    print('HomeView getOrCreateDbAndDisplayAllStocksInDb() end');
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
            await _databaseService.deleteDb();
            await _databaseService.getOrCreateDatabaseHandle();
            _list = await _databaseService.getAllRecordsFromDb();
            await _databaseService.printAllRecordsInDbToConsole();
            setState(() {});
          },
        ),
        ElevatedButton(
          child: const Text(
            'Add City Weather',
          ),
          onPressed: () {
            _inputCity();
          },
        ),
        //We must use an Expanded widget to get
        //the dynamic ListView to play nice
        //with the TextButton.
        //StockList(stocks: _stockList),
        Expanded(child: ModelElementList(modelElements: _list)),
      ],
    );
  }

  void updateUI(dynamic weatherData) {
    setState(() {
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
      weatherIcon = _weatherService.getWeatherIcon(condition);
      cityName = weatherData['name'];
      print('City Name: $cityName');
      weatherMessage = _weatherService.getMessage(temperature);
      print(weatherMessage);
    });
  }

  Future<void> _inputCity() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Input City Name'),
            contentPadding: const EdgeInsets.all(5.0),
            content: TextField(
              decoration: const InputDecoration(hintText: "City Name"),
              onChanged: (String value) {
                _citySymbol = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Add City"),
                onPressed: () async {
                  if (_citySymbol.isNotEmpty) {
                    print('User entered City: $_citySymbol');

                    try {
                      var data =
                          await _weatherService.getCityWeatherData(_citySymbol);
                      if (data == null) {
                        print(
                            "Call to getCityWeatherData failed to return data");
                      } else {
                        updateUI(data);
                        await _databaseService.insertRecord(
                          ModelElement(
                            city: cityName,
                            temperature: temperature,
                            message: weatherMessage,
                            condition: weatherIcon,
                          ),
                        );
                        _list = await _databaseService.getAllRecordsFromDb();
                        _databaseService.printAllRecordsInDbToConsole();
                        setState(() {});
                      }
                    } catch (e) {
                      print('HomeView _inputStock catch: $e');
                    }
                  }
                  _citySymbol = "";
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
}
