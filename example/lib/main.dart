import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slide_switcher/slide_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10.withOpacity(0.27),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<int> ctrl = StreamController<int>();
  final StreamController<int> ctrl1 = StreamController<int>();
  final StreamController<int> ctrl2 = StreamController<int>();
  final StreamController<int> ctrl3 = StreamController<int>();

  @override
  void dispose() {
    ctrl.close();
    ctrl1.close();
    ctrl2.close();
    ctrl3.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: ctrl.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return SlideSwitcher(
                slidersChild: [
                  Text(
                    'First',
                    style: TextStyle(
                        fontWeight: snapshot.data == 0
                            ? FontWeight.w500
                            : FontWeight.w400),
                  ),
                  Text(
                    'Second',
                    style: TextStyle(
                        fontWeight: snapshot.data == 1
                            ? FontWeight.w500
                            : FontWeight.w400),
                  ),
                ],
                streamController: ctrl,
                containerHeight: 40,
                containerWight: 350,
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl1.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return SlideSwitcher(
                slidersChild: const [
                  Text(
                    'First',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 90, 242, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Second',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 90, 242, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Third',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 90, 242, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Forth',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 90, 242, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Fifth',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 90, 242, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                streamController: ctrl1,
                slidersColors: const [Colors.white],
                containerHeight: 40,
                containerWight: 350,
                indents: 4,
                containerColor: const Color.fromRGBO(140, 176, 254, 1),
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl2.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return SlideSwitcher(
                slidersChild: const [
                  Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.add_moderator,
                    color: Colors.white,
                  ),
                ],
                streamController: ctrl2,
                containerColor: Colors.teal.withOpacity(0.5),
                slidersColors: const [Colors.teal],
                containerHeight: 50,
                containerWight: 100,
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl3.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return SlideSwitcher(
                slidersChild: const [
                  Text('First'),
                  Text('Second'),
                  Text('Third'),
                  Text('Forth'),
                ],
                streamController: ctrl3,
                containerBorderRadius: 0,
                indents: 10,
                containerBorder: Border.all(
                  width: 3,
                  color: Colors.blueGrey,
                ),
                containerColor: Colors.white,
                slidersColors: const [
                  Colors.blueGrey,
                ],
                containerHeight: 50,
                containerWight: 350,
              );
            },
          ),
        ],
      ),
    );
  }
}
