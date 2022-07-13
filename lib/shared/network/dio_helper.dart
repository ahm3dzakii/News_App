import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    var option = BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      receiveDataWhenStatusError: true,
    );

    dio = Dio(option);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token}) async {
    dio!.options.headers = {
      'Content_Type': 'application/json',
      'lang': 'ar',
      'Authorization': token ?? '',
    };
    return await dio!.get(
      url,
      queryParameters: queryParameters,
    );
  }
}
