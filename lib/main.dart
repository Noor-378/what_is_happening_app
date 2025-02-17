import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:what_is_happening_app/layout/news_layout.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  Future.delayed(Duration(milliseconds: 1)).then((value) =>
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      )));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
      home: const NewsLayout(),
    );
  }
}
