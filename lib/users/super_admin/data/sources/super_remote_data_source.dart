import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';

abstract class SuperRemoteDataSource {
  Future<List<CityModel>> getCities({required String token});
  Future<CityModel> addCity({required String token, required String name});
}

class SuperRemoteDataSourceImpl extends SuperRemoteDataSource {
  final ApiServices apiServices = ApiServices(dio: Dio());

  @override
  Future<List<CityModel>> getCities({required String token}) async {
    final Map<String, dynamic> result = await apiServices.getRequest(
      endPoint: '$registerBaseUrl/admin/showAll/city',
      headers: {'Authorization': 'Bearer $token'},
    );

    final data = result['data'] as List<dynamic>?;

    return data!
        .map((cityJson) => CityModel.fromJson(cityJson as Map<String, dynamic>))
        .toList();
  }
// 
  @override
  Future<CityModel> addCity({
    required String token,
    required String name,
  }) async {
    final result =await apiServices.postRequest(
      endPoint: '$registerBaseUrl/admin/create/city',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": name},
    );
       log('city added $result');
    return CityModel.fromJson(result['data']);
  }
}
