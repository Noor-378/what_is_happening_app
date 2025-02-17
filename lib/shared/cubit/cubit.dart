import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:what_is_happening_app/modules/business/business.dart';
import 'package:what_is_happening_app/modules/science/science.dart';
import 'package:what_is_happening_app/modules/sports/sports.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<GButton> wow =const [
    GButton(
      icon: Icons.business_outlined,
      text: "Business",
    ),
    GButton(
      icon: Icons.sports_football_outlined,
      text: "Sports",
    ),
     GButton(
      icon: Icons.science_outlined,
      text: "Science",
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}
