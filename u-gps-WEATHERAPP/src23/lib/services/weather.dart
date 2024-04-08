// ignore_for_file: avoid_print, unused_local_variable

import 'package:robbinlaw/services/location.dart';
import 'package:robbinlaw/services/network.dart';

const apiKey = 'eada4f9ea302c58abd6d02fb791a812a';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherService {

  Future<dynamic> getLocationWeatherData({double lat = 0, double lon = 0}) async {
    if(lat == 0 && lon == 0){
      LocationService locationService = LocationService();
      await locationService.getCurrentLocation();
      lat = locationService.lat;
      lon = locationService.lon;
    }
    
    Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      query: 'lat=$lat&lon=$lon&units=metric&appid=$apiKey'
    );
    print('url is: $url');
    
    NetworkService networkService = NetworkService(url);
    var weatherData = await networkService.getData();
    return weatherData;
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
