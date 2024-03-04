// ignore_for_file: use_key_in_widget_constructors, file_names, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'dart:io';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - Async/Await',
        ),
      ),
      body: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Start'),
        onPressed: () {
          performTasks1And2();
          //performTasks3And4();
          //performTasks5And6();
        },
      ),
    );
  }
}

void performTasks1And2() {
  task1();
  task2();
}

// In this task1 method the sleep method runs synchronously.
// The print statement after will not run until the
// sleep is finished.
void task1() {
  print('Task 1 start');
  Duration myFiveSeconds = const Duration(seconds: 5);
  //We can access sleep() by importing dart.io.
  sleep(myFiveSeconds);
  print('Task 1 end');
}

// In this task2 method the Future.delayed
// method runs asynchronously.
// This means that the Future will be created
// and then the next line of code print('Task 2 end')
// will run immediately.
// Only after the delay will the callback run.
void task2() {
  print('Task 2 start');
  Duration myFiveSeconds = const Duration(seconds: 5);
  //async method that will delay for 5 seconds,
  //and then run the callback method, which is
  //the second parm.
  Future.delayed(myFiveSeconds, () {
    print('Task 2 future callback complete');
  });
  print('Task 2 end');
}

void performTasks3And4() {
  String task3Result = task3();
  task4(task3Result);
}

// In this task3 method the Future.delayed
// method runs asynchronously as in task2.
String task3() {
  print('Task 3 start');
  String result = 'task 3 init data';
  Duration myFiveSeconds = const Duration(seconds: 5);
  Future.delayed(myFiveSeconds, () {
    result = 'task 3 final data';
    print('Task 3 future callback complete with $result');
  });
  print('Task 3 end');
  return result;
}

void task4(String data) {
  print('Task 4 start');
  print('Task 4 end with $data');
}

void performTasks5And6() async {
  String task5Result = await task5();
  task6(task5Result);
}

// In this task5 method the Future.delayed
// method runs synchronously.
// Because "async" is used in front of the {},
// an empty Future will be immediately returned to
// the code that called task5.
// Only when the "return" is run will
// the empty Future be filled with a data event.
Future<String> task5() async {
  print('Task 5 start');
  String result = 'task 5 init data';
  Duration myFiveSeconds = const Duration(seconds: 5);
  // Using "await" will cause this to now
  // act synchronously.
  // This means that the print('Task 5 end')
  // will not run until the callback is run.
  await Future.delayed(myFiveSeconds, () {
    result = 'task 5 final data';
    print('Task 5 future callback complete with $result');
  });
  print('Task 5 end');
  return result;
}

void task6(String data) {
  print('Task 6 start');
  print('Task 6 end with $data');
}

