import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:what_is_happening_app/modules/business/business.dart';
import 'package:what_is_happening_app/modules/science/science.dart';
import 'package:what_is_happening_app/modules/settings/settings_screen.dart';
import 'package:what_is_happening_app/modules/sports/sports.dart';
import 'package:what_is_happening_app/shared/components/constants.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';
import 'package:what_is_happening_app/shared/network/local/cache_helper.dart';
import 'package:what_is_happening_app/shared/network/remote/dio_helper.dart';
import 'package:what_is_happening_app/shared/styles/dark_theme.dart';
import 'package:what_is_happening_app/shared/styles/light_theme.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<GButton> bottomNavItems = [
    GButton(
      icon: Icons.business_outlined,
      text: "Business",
    ),
    GButton(
      icon: Icons.sports_football_outlined,
      text: "Sports",
      onPressed: () {},
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

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(BottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(GetBusinessLoadingState());

    if (business.length == 0) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "category": "business",
          "apiKey": apiKey,
        },
      ).then((value) {
        business = value.data["articles"];
        emit(GetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetBusinessErrorState(error: error.toString()));
      });
    } else {
      emit(GetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(GetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "category": "sports",
          "apiKey": apiKey,
        },
      ).then((value) {
        sports = value.data["articles"];
        emit(GetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportsErrorState(error: error.toString()));
      });
    } else {
      emit(GetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(GetScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "category": "science",
          "apiKey": apiKey,
        },
      ).then((value) {
        science = value.data["articles"];
        emit(GetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceErrorState(error: error.toString()));
      });
    } else {
      emit(GetScienceSuccessState());
    }
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if(fromShared != null){
      isDark = fromShared;
    }else{
      isDark = !isDark;
    }
    
    CacheHelper.putBool(key: "isDark", value: isDark).then((value){
      emit(ChangeAppModeState());
    });
    isDark ? darkMode : lightMode;
    
  }

  IconData changeIconTheme() {
    return isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined;
  }
}
