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
  int switcherIndex5 = 0;
  int switcherIndex6 = 0;
  int switcherIndex7 = 0;

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
              isAllContainerTap: true,
              onSelect: (int index) => setState(() => switcherIndex1 = index),
              indents: 5,
              containerColor:
                  switcherIndex1 == 0 ? Colors.grey : Colors.indigo.shade300,
            ),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: [
                Text(
                  'First',
                  style: TextStyle(
                    fontWeight:
                        switcherIndex2 == 0 ? FontWeight.w500 : FontWeight.w400,
                    color:
                        switcherIndex2 == 0 ? Colors.deepOrange : Colors.white,
                  ),
                ),
                Text(
                  'Second',
                  style: TextStyle(
                    fontWeight:
                        switcherIndex2 == 1 ? FontWeight.w500 : FontWeight.w400,
                    color:
                        switcherIndex2 == 1 ? Colors.deepOrange : Colors.white,
                  ),
                ),
              ],
              containerColor: Colors.deepOrange,
              onSelect: (int index) => setState(() => switcherIndex2 = index),
              containerHeight: 40,
              containerWight: 350,
            ),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: const [
                Text(
                  'First',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff714F43),
                  ),
                ),
                Text(
                  'Second',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff714F43),
                  ),
                ),
                Text(
                  'Third',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff714F43),
                  ),
                ),
                Text(
                  'Forth',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff714F43),
                  ),
                ),
              ],
              initialIndex: 2,
              onSelect: (int index) => setState(() => switcherIndex3 = index),
              containerBorderRadius: 0,
              indents: 10,
              containerBorder: Border.all(
                width: 3,
                color: const Color(0xffFFFFE3),
              ),
              containerColor: const Color(0xffE1CCB9).withOpacity(0.8),
              slidersColors: const [
                Color(0xffFFFFE3),
              ],
              containerHeight: 50,
              containerWight: 350,
            ),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: [
                Text(
                  'First',
                  style: TextStyle(
                      fontSize: 15,
                      color: switcherIndex4 == 0
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey),
                ),
                Text(
                  'Second',
                  style: TextStyle(
                      fontSize: 15,
                      color: switcherIndex4 == 1
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey),
                ),
                Text(
                  'Third',
                  style: TextStyle(
                      fontSize: 15,
                      color: switcherIndex4 == 2
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey),
                ),
              ],
              onSelect: (int index) => setState(() => switcherIndex4 = index),
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
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 65),
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
                  onSelect: (int index) =>
                      setState(() => switcherIndex5 = index),
                  direction: Axis.vertical,
                  containerColor: Colors.teal.withOpacity(0.5),
                  slidersColors: const [Colors.teal],
                  containerHeight: 70,
                  containerWight: 90,
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
                  onSelect: (int index) =>
                      setState(() => switcherIndex6 = index),
                  slidersColors: const [Colors.white],
                  containerHeight: 320,
                  containerWight: 60,
                  indents: 4,
                  direction: Axis.vertical,
                  containerColor: const Color.fromRGBO(140, 176, 254, 1),
                ),
                const SizedBox(width: 20),
                SlideSwitcher(
                  children: const [
                    Text(
                      'F',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'S',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  direction: Axis.vertical,
                  containerColor: Colors.purple,
                  slidersColors: [Colors.transparent],
                  slidersBorder: Border.all(color: Colors.white, width: 2),
                  containerBorder: Border.all(color: Colors.white, width: 2),
                  containerHeight: 300,
                  containerWight: 40,
                  indents: 5,
                  onSelect: (int index) =>
                      setState(() => switcherIndex7 = index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
