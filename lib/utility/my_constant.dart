import 'package:flutter/material.dart';

class MyConstant {
  //field
  static String appName = 'Check Student';
  static Color dark = Color.fromARGB(255, 1, 26, 4);
  static Color primary = Color.fromARGB(255, 5, 61, 120);
  static Color active = Colors.pink;
  static Color button = Colors.white;

  //method

  BoxDecoration basicBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        colors: [button, Colors.lime],center: const Alignment(-0.7, -0.7)
      ),
    );
  }

  TextStyle h1Style() {
    return TextStyle(
      fontSize: 30,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      fontSize: 24,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3ActiveStyle() {
    return TextStyle(
      fontSize: 16,
      color: active,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle h3ButtonStyle() {
    return TextStyle(
      fontSize: 16,
      color: button,
      fontWeight: FontWeight.w500,
    );
  }
}
