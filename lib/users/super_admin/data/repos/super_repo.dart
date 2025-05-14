import 'package:dartz/dartz.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/data/models/job_title_model.dart';

abstract class SuperRepo {
  Future<Either<Failure, List<CityModel>>> getCities({required String token});
  Future<Either<Failure, CityModel>> addCity({
    required String token,
    required String name,
  });

  Future<Either<Failure, CityModel>> updateCity({
    required String token,
    required String newName,
    required int cityid,
  });

  Future<Either<Failure, BranchModel>> addBranch({
    required String token,
    required int branchId,
    required String name,
    required String address,
  });

  Future<Either<Failure, List<BranchModel>>> getBranches({
    required String token,
  });
  Future<Either<Failure, CityModel>> updateBranch({
    required String token,
    required String newName,
    required int id,
  });







  Future<Either<Failure, String>> addJobTitle({
    required String token,
    required String name,
    required int branchId,
  });
  Future<Either<Failure, JobTitleResponse>> getJobtitles({
    required String token,
    required int branchId,
  });
  Future<Either<Failure, JobTitleResponse>> updateJobTitle({
    required String token,
    required String name,
    required int branchId,
  });

  Future<Either<Failure, JobTitleResponse>> activeJobTitle({
    required String token,
    required String jobId,
  });

  Future<Either<Failure, JobTitleResponse>> notActiveJobTitle({
    required String token,
    required String jobId,
  });
}
