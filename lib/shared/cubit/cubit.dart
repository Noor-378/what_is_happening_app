import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:what_is_happening_app/modules/business/business.dart';
import 'package:what_is_happening_app/modules/science/science.dart';
import 'package:what_is_happening_app/modules/settings/settings_screen.dart';
import 'package:what_is_happening_app/modules/sports/sports.dart';
import 'package:what_is_happening_app/shared/components/constants.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';
import 'package:what_is_happening_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<GButton> wow = const [
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
    GButton(
      icon: Icons.settings_outlined,
      text: "Settings",
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(GetBusinessLoadingState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "category": "business",
        "apiKey": apiKey,
      },
    ).then((value) {
      business = value.data["articles"];
      print(business[0]["title"]);
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessErrorState(error: error.toString()));
    });
  }
}
