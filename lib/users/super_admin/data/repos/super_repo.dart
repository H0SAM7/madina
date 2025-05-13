import 'package:dartz/dartz.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';

abstract class SuperRepo {
  Future<Either<Failure, List<CityModel>>> getCities({required String token});
  Future<Either<Failure, CityModel>> addCity({
    required String token,
    required String name,
  });

  Future<Either<Failure, CityModel>> updateCity({
    required String token,
    required String newName,
    required int id,
  });

  Future<Either<Failure, BranchModel>> addBranch({
        required String token,
    required int id,
    required String name,
    required String address,
  });

  Future<Either<Failure, List<BranchModel>>> getBranches({required String token});

}


