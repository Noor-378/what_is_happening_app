import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    actionsPadding: EdgeInsets.only(right: 10),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
);
