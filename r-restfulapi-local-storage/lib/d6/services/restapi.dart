//Edmonton, Alberta Data
//lon = -113.469
//lat = 53.55

// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:robbinlaw/d6/services/network.dart';

const url = 'https://api.quotable.io/random';

class RestAPIService {
  
  Future<dynamic> getData() async {
    Uri url = Uri(
      scheme: 'https',
      host: 'api.quotable.io',
      path: '/random',
      query: ''
    );
    NetworkService networkService = NetworkService(url);
    var data = await networkService.getData();
    return data;
  }
}
