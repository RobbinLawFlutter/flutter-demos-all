// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/d9-TODO/services/authorization.dart';
import 'package:robbinlaw/d9-TODO/views/home.dart';
import 'package:robbinlaw/d9-TODO/views/login.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('First build: Current User = ${Authorization().currentUser?.displayName}');
    Authorization().listen();
    if (Authorization().currentUser == null) {
      return Login();
    } else {
      return Home();
    }
  }
}