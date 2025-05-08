import 'package:dartz/dartz.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/users/super_admin/data/repos/super_repo.dart';

class SuperRepoImpl extends SuperRepo{
  @override
  Future<Either<Failure, Unit>> addCity() {
    throw UnimplementedError();
  }
}