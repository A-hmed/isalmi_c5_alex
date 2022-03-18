import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  //static Color primaryColor=Color(0xffb7935f);
  static Color primaryColor = Color.fromRGBO(183, 147, 95, 1);

  // MaterialColor color=MaterialColor()
  static Color accentColor = Color(0xff242424);
  static ThemeData LIGHT_THEME = ThemeData(
      primaryColor: MyThemeData.primaryColor,
      appBarTheme: AppBarTheme(color: Colors.transparent, centerTitle: true),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
              color: primaryColor, fontSize: 14, fontWeight: FontWeight.bold)));

  static ThemeData DARK_THEME = ThemeData(
      primaryColor: MyThemeData.primaryColor,
      appBarTheme: AppBarTheme(color: Colors.transparent, centerTitle: true),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
              color: primaryColor, fontSize: 14, fontWeight: FontWeight.bold)));
}
