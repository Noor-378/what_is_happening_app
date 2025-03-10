import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:what_is_happening_app/modules/business/business.dart';
import 'package:what_is_happening_app/modules/science/science.dart';
import 'package:what_is_happening_app/modules/profile/profile_screen.dart';
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
      icon: Icons.person_outline_rounded,
      text: "Profile",
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    ProfileScreen(),
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

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(GetSearchLoadingState());

    DioHelper.getData(
      url: "v2/everything",
      query: {
        "q": value,
        "apiKey": apiKey,
      },
    ).then((value) {
      search = value.data["articles"];
      emit(GetSearchSuccessState());
    }).catchError((error) {
      print("==================${error.toString()}===============");
      emit(
        GetSearchErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBool(key: "isDark", value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }

    isDark ? darkMode : lightMode;
  }

  IconData changeIconTheme() {
    return isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined;
  }

  void navigateTo(context,Widget widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  void webView(String url, WebViewController controller) {
    controller
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(url));
    emit(WebViewState());
  }

  // final user = UserPreferences.myUser;
  // void updateProfile(nameController, emailController, context) {
  //   UserPreferences.myUser.name = nameController.text;
  //   UserPreferences.myUser.name = emailController.text;
  //   Navigator.pop(context);
  // }
   
}
