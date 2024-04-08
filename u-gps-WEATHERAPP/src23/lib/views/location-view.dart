// ignore_for_file: file_names, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/utilities/constants.dart';
import 'package:robbinlaw/services/weather.dart';

class LocationView extends StatefulWidget {
  const LocationView ({required this.locationWeather});
  //const LocationView(this.locationWeather);
  final dynamic locationWeather;
  @override
  LocationViewState createState() => LocationViewState();
}

class LocationViewState extends State<LocationView> {
  
  WeatherService weatherService = WeatherService();
  late String weatherDescription;
  late int temperature;
  //double temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
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
      print(weatherDescription);
      double temp = weatherData['main']['temp'];
      //temperature = temp;
      temperature = temp.toInt();
      print(temperature);
      int condition = weatherData['weather'][0]['id'];
      print(condition);
      weatherIcon = weatherService.getWeatherIcon(condition);
      cityName = weatherData['name'];
      print(cityName);
      weatherMessage = weatherService.getMessage(temperature);
      print(weatherMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gps demo'),
        centerTitle: true,),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  //Mountain View, California Data
                  //lat = 37.42
                  //lon = -122.084
                  var weatherData =
                      await weatherService.getLocationWeatherData();
                  updateUI(weatherData);
                },
                child: const Text('phones location')
              ),
              ElevatedButton(
                onPressed: () async {
                  //Edmonton, Alberta Data
                  //lat = 53.55
                  //lon = -113.469
                  var weatherData =
                      await weatherService.getLocationWeatherData(lat: 53.55, lon: -113.469);
                  updateUI(weatherData);
                },
                child: const Text('Edmonton')
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: <Widget>[
                Text(
                  '$temperature°C',
                  style: kTempTextStyle,
                ),
                Text(
                  weatherIcon,
                  style: kConditionTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              '$weatherMessage in $cityName',
              textAlign: TextAlign.right,
              style: kMessageTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
