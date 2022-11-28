// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColor.black,
    backgroundColor: Colors.black,
    cardTheme: CardTheme(
      color: AppColor.white,
    ),
    cardColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    secondaryHeaderColor: Color(0xff232323),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xff0CABDF),
      disabledColor: Colors.grey,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        fontSize: 20,
        color: AppColor.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    cardTheme: CardTheme(
      color: AppColor.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    secondaryHeaderColor: Color(0xff232323),
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: 'Heebo',
    backgroundColor: Colors.white,
    cardColor: Colors.red,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        fontSize: 20,
        color: AppColor.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
