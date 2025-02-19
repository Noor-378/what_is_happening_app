abstract class AppStates {}

class InitialState extends AppStates {}

class BottomNavState extends AppStates {}

class GetBusinessSuccessState extends AppStates {}

class GetBusinessLoadingState extends AppStates {}

class GetBusinessErrorState extends AppStates {
  final String? error;

  GetBusinessErrorState({this.error});
}


class GetSportsSuccessState extends AppStates {}

class GetSportsLoadingState extends AppStates {}

class GetSportsErrorState extends AppStates {
  final String? error;

  GetSportsErrorState({this.error});
}
class GetScienceSuccessState extends AppStates {}

class GetScienceLoadingState extends AppStates {}

class GetScienceErrorState extends AppStates {
  final String? error;

  GetScienceErrorState({this.error});
}

class ChangeAppModeState extends AppStates{}
class wow extends AppStates{}