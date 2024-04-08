// ignore_for_file: file_names, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:robbinlaw/services/weather.dart';
import 'package:robbinlaw/views/location-view.dart';

class LoadingView2 extends StatefulWidget {
  @override
  LoadingView2State createState() => LoadingView2State();
}

class LoadingView2State extends State<LoadingView2> {
  @override
  void initState() {
    print('initState started');
    super.initState();
    getPhoneLocationWeatherData();
  }

  void getPhoneLocationWeatherData() async {
    WeatherService weatherService = WeatherService();
    print('just before call to weatherService.getLocationWeatherData()');
    var weatherData = await weatherService.getLocationWeatherData();
    print('just after call to weatherService.getLocationWeatherData()');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LocationView(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    print('build started');
    return Scaffold(
      appBar: AppBar(
        title: const Text('gps demo'),
        centerTitle: true,),
      body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100,
          ),
        ),
    );
  }
}
