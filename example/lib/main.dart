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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideSwitcher(
              children: [
                Text(
                  'First',
                  style: TextStyle(
                      fontWeight: switcherIndex1 == 0
                          ? FontWeight.w500
                          : FontWeight.w400),
                ),
                Text(
                  'Second',
                  style: TextStyle(
                      fontWeight: switcherIndex1 == 1
                          ? FontWeight.w500
                          : FontWeight.w400),
                ),
              ],
              onSelect: (index) => setState(() => switcherIndex1 = index),
              containerHeight: 40,
              containerWight: 350,
            ),
            const SizedBox(height: 20),
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
              containerHeight: 40,
              containerWight: 350,
              indents: 4,
              containerColor: const Color.fromRGBO(140, 176, 254, 1),
            ),
            const SizedBox(height: 20),
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
              containerColor: Colors.teal.withOpacity(0.5),
              slidersColors: const [Colors.teal],
              containerHeight: 50,
              containerWight: 100,
            ),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: const [
                Text('First'),
                Text('Second'),
                Text('Third'),
                Text('Forth'),
              ],
              onSelect: (index) {},
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
            ),
          ],
        ),
      ),
    );
  }
}
