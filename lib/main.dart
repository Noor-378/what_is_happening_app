import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/layout/news_layout.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/observer.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';
import 'package:what_is_happening_app/shared/network/remote/dio_helper.dart';
import 'package:what_is_happening_app/shared/styles/dark_theme.dart';
import 'package:what_is_happening_app/shared/styles/light_theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppCubit.get(context).isDark ? darkMode : lightMode,
              home: const NewsLayout(),
            );          
        },
      ),
    );
  }
}
