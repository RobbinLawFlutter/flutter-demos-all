// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:robbinlaw/services/location.dart';

//Geolocator package from pub.dev
//https://pub.dev/packages/geolocator

//flutter_spinkit from pub.dev
//https://pub.dev/packages/flutter_spinkit

//In android/app/src/main/AndroidManifest.xml
//we must copy the following directly under the
//<manifest> tag
//<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
//<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

//In ios/Runner/Info.plist
//<key>NSLocationWhenInUseUsageDescription</key>
//<string>This app needs access to location when open.</string>
//<key>NSLocationAlwaysUsageDescription</key>
//<string>This app needs access to location when in the background.</string>

class LoadingView1 extends StatefulWidget {
  @override
  LoadingView1State createState() => LoadingView1State();
}

class LoadingView1State extends State<LoadingView1> {
  LocationService locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await locationService.getCurrentLocation();
            },
            child: const Text('Get Location'),
          ),
          const SpinKitDoubleBounce(
            color: Colors.white,
            size: 100,
          ),
        ],
      ),
    );
  }
}
