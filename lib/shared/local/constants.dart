import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants{

  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white, fontFamily: 'arialregular', fontWeight: FontWeight.bold,
      fontSize: 17,),),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff343434),
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Color(0xff343434),
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'arialregular', fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff343434),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedLabelStyle: TextStyle(fontFamily: 'arialregular',  fontWeight: FontWeight.bold, fontSize: 9),
      selectedLabelStyle: TextStyle(fontFamily: 'arialregular',  fontWeight: FontWeight.bold, fontSize: 9),
    ),
    scaffoldBackgroundColor: const Color(0xff343434),
    primarySwatch: Colors.red,
  );

  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(bodyText1: TextStyle(color: Color(0xff343434), fontFamily: 'arialregular',  fontWeight: FontWeight.bold,
      fontSize: 17,),),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Color(0xff343434), fontSize: 25, fontFamily: 'arialregular', fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.red,
      unselectedLabelStyle: TextStyle(color: Color(0xff343434), fontFamily: 'arialregular',  fontWeight: FontWeight.bold, fontSize: 9),
      selectedLabelStyle: TextStyle(fontFamily: 'arialregular',  fontWeight: FontWeight.bold, fontSize: 9),
      unselectedItemColor: Color(0xff343434),
    ),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.red,
  );
}