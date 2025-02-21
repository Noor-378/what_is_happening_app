import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: false,
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: Colors.blue,
    selectionColor: Colors.blue,
    cursorColor: Colors.blue,
  ),
  textTheme: TextTheme(
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
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
  colorScheme: ColorScheme.dark(
    surface: Colors.white,
    inverseSurface: Colors.blue,
    error: Colors.white,
    errorContainer: Colors.black,
  ),
);
