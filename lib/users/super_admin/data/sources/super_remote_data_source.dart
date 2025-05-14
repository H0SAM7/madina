import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/data/models/job_title_model.dart';

abstract class SuperRemoteDataSource {
  Future<List<CityModel>> getCities({required String token});
  Future<CityModel> addCity({required String token, required String name});
  Future<CityModel> updateCity({
    required String token,
    required String newName,
    required int cityId,
  });

  Future<BranchModel> addBranch({
    required int cityId,
    required String name,
    required String token,
    required String address,
  });

  Future<List<BranchModel>> getBranches({required String token});
  // Future<CityModel> updateBranch({
  //   required String token,
  //   required String newName,
  //   required int id,
  // });

  Future<String> addJobTitle({
    required String token,
    required String name,
    required int branchId,
  });

  Future<JobTitleResponse> getJobtitles({
    required String token,
    required int branchId,
  });

  Future<JobTitleResponse> updateJobTitle({
    required String token,
    required String name,
    required int branchId,
  });

  Future<JobTitleResponse> activeJobTitle({
    required String token,
    required String jobId,
  });

  Future<JobTitleResponse> notActiveJobTitle({
    required String token,
    required String jobId,
  });
}

class SuperRemoteDataSourceImpl extends SuperRemoteDataSource {
  final ApiServices apiServices = ApiServices(dio: Dio());

  @override
  Future<List<CityModel>> getCities({required String token}) async {
    final Map<String, dynamic> result = await apiServices.getRequest(
      endPoint: '$baseUrl/admin/showAll/city',
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
      endPoint: '$baseUrl/admin/create/city',
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
    required int cityId,
  }) async {
    final result = await apiServices.postRequest(
      endPoint: '$baseUrl/admin/create/city/$cityId',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": newName},
    );
    log('city added $result');
    return CityModel.fromJson(result['data']);
  }

  @override
  Future<BranchModel> addBranch({
    required int cityId,
    required String token,
    required String name,
    required String address,
  }) async {
    final result = await apiServices.postRequest(
      endPoint: '$baseUrl/admin/create/branch',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": name, "city_id": cityId, "address": address},
    );

    log('branch added ${result['message']}');
    return BranchModel.fromJson(result['data']);
  }

  @override
  Future<List<BranchModel>> getBranches({required String token}) async {
    final Map<String, dynamic> result = await apiServices.getRequest(
      endPoint: '$baseUrl/admin/showAll/branch',
      headers: {'Authorization': 'Bearer $token'},
    );

    final data = result['data'] as List<dynamic>?;

    return data!
        .map((branchs) => BranchModel.fromJson(branchs as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<String> addJobTitle({
    required String token,
    required String name,
    required int branchId,
  }) async {
    final result = await apiServices.postRequest(
      endPoint: '$baseUrl/admin/create/title',
      headers: {'Authorization': 'Bearer $token'},
      data: {"name": name, "branch_id": branchId},
    );

    log('jobtitle added ${result['message']}');
    return (result['message']);
  }

  @override
  Future<JobTitleResponse> activeJobTitle({
    required String token,
    required String jobId,
  }) {
    // TODO: implement activeJobTitle
    throw UnimplementedError();
  }


//////////////////////

  @override
  Future<JobTitleResponse> getJobtitles({
    required String token,
    required int branchId,
  }) async {
    final result = await apiServices.getRequest(
      endPoint: '$baseUrl/admin/showAll/title',
      headers: {'Authorization': 'Bearer $token'},
    );

    final data = JobTitleResponse.fromJson(result);

    return data;
  }




////////////////////////
  @override
  Future<JobTitleResponse> notActiveJobTitle({
    required String token,
    required String jobId,
  }) {
    // TODO: implement notActiveJobTitle
    throw UnimplementedError();
  }

  @override
  Future<JobTitleResponse> updateJobTitle({
    required String token,
    required String name,
    required int branchId,
  }) {
    // TODO: implement updateJobTitle
    throw UnimplementedError();
  }

  // @override
  // Future<CityModel> updateBranch({
  //   required String token,
  //   required String newName,
  //   required int id,
  // }) async {
  //   final result = await apiServices.postRequest(
  //     endPoint: '$registerBaseUrl/admin/update/branch/$id',
  //     headers: {'Authorization': 'Bearer $token'},
  //     data: {"name": newName,
  //     "city_id":
  //     "address":
  //     },
  //   );
  //   log('city added $result');
  // }
}
