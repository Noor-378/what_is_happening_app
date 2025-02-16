import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      label: "Business",
      icon: Icon(
        Icons.business_center_outlined,
      ),
    ),
    BottomNavigationBarItem(
      label: "Sports",
      icon: Icon(
        Icons.sports_soccer_outlined,
      ),
    ),
    BottomNavigationBarItem(
      label: "Science",
      icon: Icon(
        Icons.science_outlined,
      ),
    ),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}
