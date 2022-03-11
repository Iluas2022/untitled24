import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.indigo,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
  ).copyWith(
    secondary: Colors.lightGreenAccent,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 30.0, color: Colors.green, fontStyle: FontStyle.normal),
    bodyText2: TextStyle(fontSize: 24.0, fontFamily: 'Hind', color: Colors.cyanAccent),
  ),
);