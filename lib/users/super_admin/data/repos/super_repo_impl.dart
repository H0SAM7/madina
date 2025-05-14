import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/core/utils/helper.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/data/models/job_title_model.dart';
import 'package:madina/users/super_admin/data/repos/super_repo.dart';
import 'package:madina/users/super_admin/data/sources/super_remote_data_source.dart';

class SuperRepoImpl extends SuperRepo {
  final ApiServices apiServices = ApiServices(dio: Dio());
  final SuperRemoteDataSource superRemoteDataSource;

  SuperRepoImpl({required this.superRemoteDataSource});
  @override
  Future<Either<Failure, List<CityModel>>> getCities({
    required String token,
  }) async {
    try {
      List<CityModel> cities = await superRemoteDataSource.getCities(
        token: token,
      );
      return right(cities);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityModel>> addCity({
    required String token,
    required String name,
  }) async {
    try {
      CityModel city = await superRemoteDataSource.addCity(
        token: token,
        name: name,
      );

      return right(city);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityModel>> updateCity({
    required String token,
    required String newName,
    required int cityid,
  }) async {
    try {
      CityModel city = await superRemoteDataSource.updateCity(
        token: token,
        newName: newName,
        cityId: cityid,
      );

      return right(city);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BranchModel>> addBranch({
    required String token,
    required int branchId,
    required String name,
    required String address,
  }) async {
    try {
      BranchModel branchModel = await superRemoteDataSource.addBranch(
        token: token,
        name: name,
        cityId: branchId,
        address: address,
      );

      return right(branchModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BranchModel>>> getBranches({
    required String token,
  }) async {
    try {
      List<BranchModel> cities = await superRemoteDataSource.getBranches(
        token: token,
      );
      return right(cities);
    } catch (e) {
      return handleError(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addJobTitle({
    required String token,
    required String name,
    required int branchId,
  }) async {
    try {
      String jobTitleResponse = await superRemoteDataSource
          .addJobTitle(token: token, name: name, branchId: branchId);

      return right(jobTitleResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityModel>> updateBranch({
    required String token,
    required String newName,
    required int id,
  }) {
    // TODO: implement updateBranch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JobTitleResponse>> getJobtitles({
    required String token,
    required int branchId,
  }) async{
 try {
     JobTitleResponse jobTitleResponse = await superRemoteDataSource.getJobtitles(
        token: token,
        branchId: branchId,
      );
      return right(jobTitleResponse);
    } catch (e) {
      return handleError(e);

    }
  }

  @override
  Future<Either<Failure, JobTitleResponse>> activeJobTitle({
    required String token,
    required String jobId,
  }) {
    // TODO: implement JobTitleResponse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JobTitleResponse>> notActiveJobTitle({
    required String token,
    required String jobId,
  }) {
    // TODO: implement notActiveJobTitle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JobTitleResponse>> updateJobTitle({
    required String token,
    required String name,
    required int branchId,
  }) {
    // TODO: implement updateJobTitle
    throw UnimplementedError();
  }
}
