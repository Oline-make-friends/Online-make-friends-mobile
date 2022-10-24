import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    // useMaterial3: true,
    primaryColor: const Color(0xFF116ddd),
    backgroundColor: const Color(0xFFdee9f1),
    scaffoldBackgroundColor: const Color(0xFFdee9f1),
    fontFamily: 'JosefinSans',
    buttonColor: const Color(0xFF2f4252),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF116ddd),
        fontSize: 29,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Color(0xFF116ddd),
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Color(0xFF116ddd),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Color(0xFF116ddd),
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Color(0xFF116ddd),
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Color(0xFF116ddd),
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.black54,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: Colors.black54,
        fontSize: 12,
      ),
    ),
  );
}
