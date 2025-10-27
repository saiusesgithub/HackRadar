import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Bitcount',
            fontSize: 30,
            color: Color(0xff000000),
          ),
    backgroundColor: Color(0xff00ffd5),
    elevation: 10,
    centerTitle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    selectedItemColor: Color(0xff03fcd3),
    unselectedItemColor: Color(0xff9e9e9e),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 10,
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 45, 45, 49),
  primarySwatch: Colors.teal,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
