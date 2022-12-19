import 'package:flutter/material.dart';

import 'colors.dart';

class My_ThemData {
  static ThemeData lightThem = ThemeData(
      primaryColor: PRIMARY_COLOR,
      scaffoldBackgroundColor: GREEN_BACGROUND,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: PRIMARY_COLOR,
        onPrimary: WHITE_COLOR,
        secondary: GREEN_COLOR,
        onSecondary: WHITE_COLOR,
        error: Colors.red,
        onError: WHITE_COLOR,
        background: GREEN_BACGROUND,
        onBackground: BLACE_COLOR,
        surface: Colors.grey,
        onSurface: WHITE_COLOR,
      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: WHITE_COLOR), centerTitle: false),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: WHITE_COLOR),
          subtitle1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
          subtitle2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: GREEN_COLOR)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: WHITE_COLOR,
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: Colors.grey));

  static ThemeData darkThem = ThemeData(
      primaryColor: PRIMARY_DARK,
      scaffoldBackgroundColor: GREEN_BACGROUND,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: PRIMARY_COLOR,
        onPrimary: WHITE_COLOR,
        secondary: GREEN_COLOR,
        onSecondary: WHITE_COLOR,
        error: Colors.red,
        onError: WHITE_COLOR,
        background: GREEN_BACGROUND,
        onBackground: BLACE_COLOR,
        surface: Colors.grey,
        onSurface: WHITE_COLOR,
      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: WHITE_COLOR), centerTitle: false),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: WHITE_COLOR),
          subtitle1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
          subtitle2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: GREEN_COLOR)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: WHITE_COLOR,
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: Colors.grey));
}
