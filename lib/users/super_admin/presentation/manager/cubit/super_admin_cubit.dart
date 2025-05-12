import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/data/repos/super_repo_impl.dart';
import 'package:madina/users/super_admin/data/sources/super_remote_data_source.dart';
import 'package:meta/meta.dart';

part 'super_admin_state.dart';

class SuperAdminCubit extends Cubit<SuperAdminState> {
  SuperRepoImpl _superRepoImpl = SuperRepoImpl(
    superRemoteDataSource: SuperRemoteDataSourceImpl(),
  );
  SuperAdminCubit() : super(SuperAdminInitial());
  Future<void> getCities({required String token}) async {
    emit(Loading());
    final data = await _superRepoImpl.getCities(token: token);

    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(Failure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');

        emit(CitySuccess(cities: data));
      },
    );
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
}
