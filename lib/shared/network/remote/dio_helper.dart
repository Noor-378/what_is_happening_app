import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }
}