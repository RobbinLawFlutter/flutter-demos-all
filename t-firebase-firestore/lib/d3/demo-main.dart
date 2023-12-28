// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:async';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D3 - StreamBuilder',
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

  void startTimer() {
      timer = Timer.periodic(interval, (x) {
        tick();
      });
      print('timer created and started');
    }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
      print('timer stopped and killed');
    }
  }

  void tick() {
    counter++;
    if (counter == (maxCount / 2)) {
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
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    startTimer();
    return Container(
      alignment: FractionalOffset.center,
      child: StreamBuilder(
        stream: controller.stream,
        builder: (BuildContext context, snapshot) {
          List<Widget> children;
          print('StreamBuilder.builder ${snapshot.connectionState}; counter: $counter');
          if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                children = <Widget>[
                  const Icon(
                    Icons.info,
                    color: Colors.blue,
                    size: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('(none)'),
                  )
                ];
                break;
              case ConnectionState.waiting:
                children = <Widget>[
                  const SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('(waiting)'),
                  )
                ];
                break;
              case ConnectionState.active:
                children = <Widget>[
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('\$${snapshot.data} (active)'),
                  )
                ];
                break;
              case ConnectionState.done:
                children = <Widget>[
                  const Icon(
                    Icons.info,
                    color: Colors.blue,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('\$${snapshot.data} (done)'),
                  )
                ];
                break;
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
        },
      ),
    );
  }
}
