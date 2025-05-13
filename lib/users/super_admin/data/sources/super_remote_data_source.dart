import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';

abstract class SuperRemoteDataSource {
  Future<List<CityModel>> getCities({required String token});
  Future<CityModel> addCity({required String token, required String name});
  Future<CityModel> updateCity({
    required String token,
    required String newName,
    required int id,
  });

  Future<BranchModel> addBranch({
    required int id,
    required String name,
    required String token,
    required String address,
  });

  Future<List<BranchModel>> getBranches({required String token});
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
    final result = await apiServices.postRequest(
      endPoint: '$registerBaseUrl/admin/create/city',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": name},
    );
    log('city added $result');
    return CityModel.fromJson(result['data']);
  }

  @override
  Future<CityModel> updateCity({
    required String token,
    required String newName,
    required int id,
  }) async {
    final result = await apiServices.postRequest(
      endPoint: '$registerBaseUrl/admin/create/city/$id',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": newName},
    );
    log('city added $result');
    return CityModel.fromJson(result['data']);
  }

  @override
  Future<BranchModel> addBranch({
    required int id,
    required String token,
    required String name,
    required String address,
  }) async {
    final result = await apiServices.postRequest(
      endPoint: '$registerBaseUrl/admin/create/branch',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": name, "city_id": id, "address": address},
    );

    log('branch added ${result['message']}');
    return BranchModel.fromJson(result['data']);
  }

  @override
  Future<List<BranchModel>> getBranches({required String token}) async {
    final Map<String, dynamic> result = await apiServices.getRequest(
      endPoint: '$registerBaseUrl/admin/showAll/branch',
      headers: {'Authorization': 'Bearer $token'},
    );

    final data = result['data'] as List<dynamic>?;

    return data!
        .map((branchs) => BranchModel.fromJson(branchs as Map<String, dynamic>))
        .toList();
  }
}
