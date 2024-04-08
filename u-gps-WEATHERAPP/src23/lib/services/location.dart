// ignore_for_file: avoid_print

import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocationService {
  late double lat;
  late double lon;

  Future<void> getCurrentLocation() async {
    print('inside getCurrentLocation');
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('services not enabled');
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          print('Location permissions are denied');
          Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        print('Location permissions are permanently denied');
        Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      print('about to run Geolocator.getCurrentPosition');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: const Duration(minutes: 1));
      print('after running Geolocator.getCurrentPosition');
      lat = position.latitude;
      lon = position.longitude;
      print('phone location retrieved: lon: $lon  lat: $lat');
    } on TimeoutException catch (e) {
      print('phone location retrieved: NO  ERROR: $e');
      print('about to run Geolocator.GetLastKnownPosition');
      Position? position = await Geolocator.getLastKnownPosition();
      if(position != null){
        lat = position.latitude;
        lon = position.longitude;
        print('phone location retrieved: lon: $lon  lat: $lat');
      } 
    } catch (e) {
      print('phone location retrieved: NO  ERROR: $e');
    }
  }
}
