import 'package:dartz/dartz.dart';
import 'package:madina/core/error/dio_failures.dart';

abstract class StockRepo {
  Future<Either<Failure, Unit>> addProduct();
  // Future<Either<Failure, Unit>> getProducts();


}