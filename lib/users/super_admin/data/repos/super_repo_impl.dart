import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
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
    required int id,
  }) async {
    try {
      CityModel city = await superRemoteDataSource.updateCity(
        token: token,
        newName: newName,
        id: id,
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
    required int id,
    required String name,
    required String address,
  }) async {
    try {
      BranchModel branchModel = await superRemoteDataSource.addBranch(
        token: token,
        name: name,
        id: id,
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
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
