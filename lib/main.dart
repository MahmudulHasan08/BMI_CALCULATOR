import 'package:flutter/material.dart';
import 'screens/input_pages.dart';
import 'screens/result_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      //WARNNING When using initialRoute, don’t define a home property.
      home: InputPage(),
      //on the first screen widget
      // initialRoute: '/',
      // routes: {
      //   //when navigating to the '/' routes ,build the first screen widget
      //   '/': (context) => InputPage(),
      //   '/first': (context) => ResultPage(),
      // },
    );
  }
}
