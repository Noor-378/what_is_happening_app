import 'package:flutter/material.dart';
import 'package:what_is_happening_app/layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      home: const HomeLayout(),
    );
  }
}
