import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff00ffd5),
    elevation: 0,
    centerTitle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff000000),
    selectedItemColor: Color(0xff03fcd3),
    unselectedItemColor: Color(0xff9e9e9e),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 10,
  ),
  scaffoldBackgroundColor: Color(0xFF0e0e12),
  primarySwatch: Colors.teal,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
