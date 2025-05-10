import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/users/super_admin/data/repos/super_repo.dart';

class SuperRepoImpl extends SuperRepo{
  final ApiServices apiServices=ApiServices(dio: Dio());
  @override
  Future<Either<Failure, Unit>> addCity() {

        throw UnimplementedError();

// try {
//   final result=apiServices.postRequest(endPoint: 'endPoint');
// }  catch (e) {




// }
  }
  
  @override
  Future<Either<Failure, Unit>> addBranch() {
    // TODO: implement addBranch
    throw UnimplementedError();
  }
}