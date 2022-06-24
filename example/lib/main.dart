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
  int switcherIndex1 = 0;
  int switcherIndex2 = 0;
  int switcherIndex3 = 0;
  int switcherIndex4 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: switcherIndex1 == 0
          ? Colors.white10.withOpacity(0.27)
          : Colors.white10.withOpacity(0.2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideSwitcher(
                children: [
                  Container(),
                  Container(),
                ],
                containerHeight: 30,
                containerWight: 60,
                onSelect: (int index) => setState(() => switcherIndex1 = index),
                indents: 5,
                containerColor:
                    switcherIndex1 == 0 ? Colors.grey : Colors.indigo.shade300),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: [
                Text(
                  'First',
                  style: TextStyle(
                      fontWeight: switcherIndex2 == 0
                          ? FontWeight.w500
                          : FontWeight.w400),
                ),
                Text(
                  'Second',
                  style: TextStyle(
                      fontWeight: switcherIndex2 == 1
                          ? FontWeight.w500
                          : FontWeight.w400),
                ),
              ],
              onSelect: (index) => setState(() => switcherIndex2 = index),
              containerHeight: 40,
              containerWight: 350,
            ),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: [
                Text(
                  'First',
                  style: TextStyle(
                      fontWeight: switcherIndex3 == 0
                          ? FontWeight.w600
                          : FontWeight.w400),
                ),
                Text(
                  'Second',
                  style: TextStyle(
                      fontWeight: switcherIndex3 == 1
                          ? FontWeight.w600
                          : FontWeight.w400),
                ),
                Text(
                  'Third',
                  style: TextStyle(
                      fontWeight: switcherIndex3 == 2
                          ? FontWeight.w600
                          : FontWeight.w400),
                ),
                Text(
                  'Forth',
                  style: TextStyle(
                      fontWeight: switcherIndex3 == 3
                          ? FontWeight.w600
                          : FontWeight.w400),
                ),
              ],
              onSelect: (int index) => setState(() => switcherIndex3 = index),
              containerBorderRadius: 0,
              indents: 10,
              containerBorder: Border.all(
                width: 3,
                color: const Color.fromRGBO(232, 99, 60, 1.0),
              ),
              containerColor: Colors.white,
              slidersColors: const [
                const Color.fromRGBO(232, 99, 60, 1.0),
              ],
              containerHeight: 50,
              containerWight: 350,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 30),
                SlideSwitcher(
                  children: const [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.add_moderator,
                      color: Colors.white,
                    ),
                  ],
                  onSelect: (index) {},
                  direction: Axis.vertical,
                  containerColor: Colors.teal.withOpacity(0.5),
                  slidersColors: const [Colors.teal],
                  containerHeight: 70,
                  containerWight: 100,
                ),
                const SizedBox(width: 20),
                SlideSwitcher(
                  children: const [
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
                  onSelect: (index) {},
                  slidersColors: const [Colors.white],
                  containerHeight: 320,
                  containerWight: 60,
                  indents: 4,
                  direction: Axis.vertical,
                  containerColor: const Color.fromRGBO(140, 176, 254, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
