

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:madina/core/error/dio_failures.dart';

Either<Failure, T> handleError<T>(dynamic e) {
  if (e is DioException) {
    return left(ServerFailure.fromDioException(e));
  }
  return left(ServerFailure(errMessage: e.toString()));
}
