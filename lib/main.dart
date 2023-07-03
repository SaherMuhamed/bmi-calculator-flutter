import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BMICalculator());

}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF090C22),
        ),
        scaffoldBackgroundColor: const Color(0xFF090C22),
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const InputPage(),
      //   '/result': (context) => const ResultPage(),
      // },
    );
  }
}
