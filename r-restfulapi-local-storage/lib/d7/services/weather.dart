//Edmonton, Alberta Data
//lon = -113.469
//lat = 53.55

// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:robbinlaw/d6/services/network.dart';

const apiKey = 'eada4f9ea302c58abd6d02fb791a812a';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherService {
  
  Future<dynamic> getCityWeatherData(String cityName) async {
    var urlOneString = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    
    Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      query: 'q=$cityName&units=metric&appid=$apiKey'
    );
    NetworkService networkService = NetworkService(url);
    var data = await networkService.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
