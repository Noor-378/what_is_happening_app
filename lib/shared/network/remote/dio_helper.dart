import 'package:dio/dio.dart';
import 'package:what_is_happening_app/shared/components/constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
  }) async {
    //get need the method url
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
