import 'package:dio/dio.dart';

import '../constants/end_points.dart';

class AppNetworkServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future getData({
    Map<String, dynamic>? query,
    required String endPoint,
  }) async {
    Response response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }
}
