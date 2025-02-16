import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit() : super (InitialState());

  static AppCubit get (context)=> BlocProvider.of(context);
  
}