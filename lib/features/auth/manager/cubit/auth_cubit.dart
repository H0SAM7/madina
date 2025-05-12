import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:madina/core/error/dio_failures.dart';
import 'package:madina/core/models/user_model.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/services/api_services.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final ApiServices _apiServices = ApiServices(dio: Dio());

  Future<void> register({Map<String, dynamic>? data}) async {
    final String registerUrl = '/admin/register';
    try {
      emit(AuthLoading());
      final response = await _apiServices.postRequest(
        endPoint: '$registerBaseUrl$registerUrl',
        data: data,
        headers: {'Accept': 'application/json'},
      );
      log(response.toString());
      if (response['success'] == true) {
        log(response['success'].toString());
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(errMessage: response['message']));
      }
    } catch (e) {
      if (e is DioException) {
        log('dio excption $e');
        emit(
          AuthFailure(
            errMessage: ServerFailure.fromDioException(e).errMessage.toString(),
          ),
        );
      } else {
        log(' excption $e');

        emit(AuthFailure(errMessage: 'Unexpected error: ${e.toString()}'));
      }
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      final response = await _apiServices.postRequest(
        endPoint: '$loginBaseUrl/admin/login',
        data: {"email": email, "password": password},
      );
      emit(AuthloginSuccess(token: 'token', usertype: 'usertype'));
      final token = response['access_token'];
      if (token != null) {
        LocalStorage.saveData('token', token);
      }
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

  Future<void> logout() async {
    final token = await LocalStorage.getData('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await _apiServices.postRequest(
      endPoint: '$loginBaseUrl/admin/logout',
      headers: headers,
    );
    LocalStorage.removeData(token);
  }

  Future<UserModel?> getUserProfile() async {
    try {
      final token = await LocalStorage.getData('token');
      var headers = {'Authorization': 'Bearer $token'};
      var response = await _apiServices.getRequest(
        endPoint: '$loginBaseUrl/admin/user-profile',
        headers: headers,
      );
      log(response.toString());

      if (response['data'] != null) {
        return UserModel.fromJson(response['data']);
      }
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
