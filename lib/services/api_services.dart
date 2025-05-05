import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});
  Future<Map<String, dynamic>> getRequest(
      {required String endPoint, queryParameters, Map<String, dynamic>? headers,}) async {
    Response response = await dio.get(
      endPoint,
       options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      
      options: Options(headers: headers),
    );
    return response.data;
  }
}
