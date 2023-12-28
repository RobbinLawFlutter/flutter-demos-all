// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'dart:async';

//https://api.dart.dev/stable/3.1.5/dart-async/StreamController-class.html

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D2 - Streams-Timers',
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
  Timer? timer;
  Duration interval = const Duration(seconds: 2);
  int maxCount = 10;
  int counter = 0;

  StreamController<int> controller = StreamController<int>(
    onListen: () {
      print('StreamController onListen');
    },
    onPause: () {
      print('StreamController onPause');
    },
    onResume: () {
      print('StreamController onResume');
    },
    onCancel: () {
      print('StreamController onCancel');
    },
  );

  StreamSubscription<int>? subscription;

  void startTimer() {
    if(timer == null){
      timer = Timer.periodic(interval, (x) {
      tick();
    });
    print('timer created and started');
    }
    else{
      print('timer already on');
    }
  }

  void stopTimer() {
    if (timer == null) {
      print('timer already off');
    }else{
      timer!.cancel();
      timer = null;
      print('timer stopped and killed');
    }
  }

  void tick() {
    try{
      counter++;
      if(controller.isClosed == true){
        print('controller stream is closed so events CANNOT be added');
      } else if (counter == (maxCount / 2)) {
        // Ask stream to send a string as an error event.
        controller.addError('error event');
      } else {
        // Ask stream to send counter value as a data event.
        controller.add(counter);
      }
      if (counter == maxCount) {
        // Stop and kill the timer instance.
        stopTimer();
        // Ask stream to shut down and tell listeners.
        controller.close();
      }
    } catch(e){
      print('error in tick $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    //subscribe to listen to the stream.
    subscription = controller.stream.listen((event) {
      print('StreamSubscription onData: $event');
    }, onError: (error) {
      print('StreamSubscription onError: $error');
    }, onDone: () {
      print('StreamSubscription onDone');
    });

    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('Start timer'),
            onPressed: () {
              startTimer();
            },
          ),
          ElevatedButton(
            child: const Text('Stop timer'),
            onPressed: () {
              stopTimer();
            },
          ),
          ElevatedButton(
            child: const Text('Reset Counter'),
            onPressed: () {
              counter = 0;
            },
          ),
          ElevatedButton(
            child: const Text('Pause Subscription'),
            onPressed: () {
              subscription?.pause();
            },
          ),
          ElevatedButton(
            child: const Text('Resume Subscription'),
            onPressed: () {
              subscription?.resume();
            },
          ),
        ],
      ),
    );
  }
}
