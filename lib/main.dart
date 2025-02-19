import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:what_is_happening_app/modules/splash/splash_screen.dart';
import 'package:what_is_happening_app/shared/cubit/observer.dart';
import 'package:what_is_happening_app/shared/network/remote/dio_helper.dart';
import 'package:what_is_happening_app/shared/styles/dark_theme.dart';
import 'package:what_is_happening_app/shared/styles/light_theme.dart';

void main() {
  Future.delayed(const Duration(milliseconds: 1)).then(
    (value) => SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
