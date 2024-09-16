import 'package:dio/dio.dart';
import 'package:elevate_task/core/utils/constants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? param, Map<String, dynamic>? headers}) {

    return dio.get(Constants.baseURL + endPoint,
        queryParameters: param, options: Options(headers: headers));
  }
}
