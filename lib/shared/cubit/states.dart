abstract class AppStates {}

class InitialState extends AppStates {}

class BottomNavState extends AppStates {}

class GetBusinessSuccessState extends AppStates {}

class LoadingState extends AppStates {}

class GetBusinessErrorState extends AppStates {
  final String? error;

  GetBusinessErrorState({this.error});
}
