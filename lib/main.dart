import 'package:flutter/material.dart';
import 'input_page.dart';
import 'resultpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(

          //scaffoldBackgroundColor: Colors.red,
          ),
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}
