// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
//dart:convert allows us to use jsonDecode
import 'dart:convert';

class NetworkService {
  NetworkService(this.url);
  final Uri url;

  Future getData() async {
    try{
      http.Response response =await http.get(url, headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Access-Control-Allow-Methods':
          'GET,PUT,POST,DELETE'
        });
      if (response.statusCode != 200) {
        print('ERROR response status code: ${response.statusCode}');
      } else {
        String data = response.body;
        return jsonDecode(data);
      }
    } catch (e) {
      print('NetworkService getData catch: $e');
    }
  }
}
