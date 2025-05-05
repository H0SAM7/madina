import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/services/api_services.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final ApiServices _apiServices = ApiServices(dio: Dio());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final response = await _apiServices.postRequest(
        endPoint: '',
        data: {"email": email, "password": password},
      );
      emit(AuthSuccess());
    } catch (e) {
      if (e is DioException) {
        emit(
          AuthFailure(
            errMessage: ServerFailure.fromDioException(e).errMessage.toString(),
          ),
        );
      } else {
        emit(AuthFailure(errMessage: 'Unexpected error: ${e.toString()}'));
      }
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      final response = await _apiServices.postRequest(
        endPoint: '',
        data: {"email": email, "password": password},
      );
      emit(AuthloginSuccess(token: 'token', usertype: 'usertype'));
    } catch (e) {
      if (e is DioException) {
        emit(
          AuthFailure(
            errMessage: ServerFailure.fromDioException(e).errMessage.toString(),
          ),
        );
      } else {
        emit(AuthFailure(errMessage: 'Unexpected error: ${e.toString()}'));
      }
    }
  }
}
