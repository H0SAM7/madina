import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/data/models/job_title_model.dart';
import 'package:madina/users/super_admin/data/repos/super_repo_impl.dart';
import 'package:madina/users/super_admin/data/sources/super_remote_data_source.dart';
import 'package:meta/meta.dart';

part 'super_admin_state.dart';

class SuperAdminCubit extends Cubit<SuperAdminState> {
  final SuperRepoImpl _superRepoImpl = SuperRepoImpl(
    superRemoteDataSource: SuperRemoteDataSourceImpl(),
  );

  List<CityModel> cities = [];

 

  String? currentAction;

  SuperAdminCubit() : super(SuperAdminInitial());
  Future<void> getCities({required String token}) async {
    if (cities.isEmpty) {
      emit(Loading());
      final data = await _superRepoImpl.getCities(token: token);

      data.fold(
        (failure) {
          log(failure.errMessage.toString());
          emit(Failure(errmessage: failure.errMessage.toString()));
        },
        (data) {
          log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');
          if (cities.isEmpty) {
            cities = data;
          }

          // emit(CitySuccess(cities: data));
          emit(Success());
        },
      );
    }
  }

  Future<void> addCity({required String token, required String name}) async {
    emit(Loading());
    final data = await _superRepoImpl.addCity(token: token, name: name);
    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(Failure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');

        emit(Success());
      },
    );
  }

  Future<void> updateCity({
    required String token,
    required String newName,
    required int id,
  }) async {
    emit(Loading());
    final data = await _superRepoImpl.updateCity(
      token: token,
      newName: newName,
      cityid: id,
    );
    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(Failure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');

        emit(Success());
      },
    );
  }


}
