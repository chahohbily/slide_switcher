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
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10.withOpacity(0.27),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<int> ctrl = StreamController<int>();
  final StreamController<int> ctrl1 = StreamController<int>();
  final StreamController<int> ctrl2 = StreamController<int>();
  final StreamController<int> ctrl3 = StreamController<int>();
  final StreamController<int> ctrl4 = StreamController<int>();
  final StreamController<int> ctrl5 = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    //ctrl.stream.listen((data) => print('$data'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: ctrl.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 220),
                    child: Text(
                      'Slider index: ${snapshot.data}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SlideSwitcher(
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
                    containerColor: Colors.grey,
                    slidersColors: [Colors.white],
                    containerHeight: 40,
                    containerWight: 350,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl1.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 160),
                    child: Text(
                      'Slider index: ${snapshot.data}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SlideSwitcher(
                    slidersChild: [
                      Text(
                        'Balance',
                        style: TextStyle(
                            fontSize: 15,
                            color: snapshot.data == 0
                                ? Colors.white.withOpacity(0.9)
                                : Colors.grey),
                      ),
                      Text(
                        'Exchange',
                        style: TextStyle(
                            fontSize: 15,
                            color: snapshot.data == 1
                                ? Colors.white.withOpacity(0.9)
                                : Colors.grey),
                      ),
                      Text(
                        'Output',
                        style: TextStyle(
                            fontSize: 15,
                            color: snapshot.data == 2
                                ? Colors.white.withOpacity(0.9)
                                : Colors.grey),
                      ),
                    ],
                    streamController: ctrl1,
                    containerColor: Colors.transparent,
                    containerBorder: Border.all(color: Colors.white),
                    slidersGradients: const [
                      LinearGradient(
                        colors: [
                          Color.fromRGBO(47, 105, 255, 1),
                          Color.fromRGBO(188, 47, 255, 1),
                        ],
                      ),
                      LinearGradient(
                        colors: [
                          Color.fromRGBO(47, 105, 255, 1),
                          Color.fromRGBO(0, 192, 169, 1),
                        ],
                      ),
                      LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 105, 105, 1),
                          Color.fromRGBO(255, 62, 62, 1),
                        ],
                      ),
                    ],
                    indents: 9,
                    containerHeight: 50,
                    containerWight: 315,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl2.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 220),
                    child: Text(
                      'Slider index: ${snapshot.data}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SlideSwitcher(
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
                    streamController: ctrl2,
                    slidersColors: [Colors.white],
                    containerHeight: 40,
                    containerWight: 350,
                    indents: 4,
                    containerColor: Color.fromRGBO(140, 176, 254, 1),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl3.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 160),
                    child: Text(
                      'Slider index: ${snapshot.data}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SlideSwitcher(
                    slidersChild: [
                      Text(
                        'First',
                        style: TextStyle(
                          color: snapshot.data == 0
                              ? const Color.fromRGBO(236, 81, 44, 1)
                              : Colors.white,
                          fontWeight: snapshot.data == 0
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Second',
                        style: TextStyle(
                          color: snapshot.data == 1
                              ? const Color.fromRGBO(236, 81, 44, 1)
                              : Colors.white,
                          fontWeight: snapshot.data == 1
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Third',
                        style: TextStyle(
                          color: snapshot.data == 2
                              ? const Color.fromRGBO(236, 81, 44, 1)
                              : Colors.white,
                          fontWeight: snapshot.data == 2
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                    streamController: ctrl3,
                    containerColor: Color.fromRGBO(236, 81, 44, 1),
                    slidersColors: [Colors.white],
                    containerHeight: 40,
                    containerWight: 250,
                    containerBorderRadius: 5,
                    indents: 3,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl4.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  Text(
                    'Slider index: ${snapshot.data}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SlideSwitcher(
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
                    streamController: ctrl4,
                    containerColor: Colors.teal.withOpacity(0.5),
                    slidersColors: [Colors.teal],
                    containerHeight: 50,
                    containerWight: 100,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder<int>(
            stream: ctrl5.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 250),
                    child: Text(
                      'Slider index: ${snapshot.data}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SlideSwitcher(
                    slidersChild: const [
                      Text('First'),
                      Text('Second'),
                      Text('Third'),
                      Text('Forth'),
                    ],
                    streamController: ctrl5,
                    containerBorderRadius: 0,
                    indents: 10,
                    containerBorder: Border.all(
                      width: 3,
                      color: Color.fromRGBO(255, 204, 1, 1),
                    ),
                    containerColor: Colors.white,
                    slidersColors: [
                      Color.fromRGBO(255, 204, 1, 1),
                    ],
                    containerHeight: 50,
                    containerWight: 350,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
