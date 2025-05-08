import 'package:dartz/dartz.dart';
import 'package:madina/core/error/dio_failures.dart';

abstract class SuperRepo {
  Future<Either<Failure, Unit>> addCity();
}
