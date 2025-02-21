import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: false,
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: Colors.blue,
    selectionColor: Colors.blue,
    cursorColor: Colors.blue,
  ),
  textTheme: TextTheme(
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 60, 60, 60)),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 60, 60, 60),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    actionsPadding: EdgeInsets.only(right: 10),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: Color.fromARGB(255, 60, 60, 60),
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade400,
    inverseSurface: Colors.blue,
    error: Color.fromARGB(255, 60, 60, 60),
    errorContainer: Colors.white,
  ),
);
