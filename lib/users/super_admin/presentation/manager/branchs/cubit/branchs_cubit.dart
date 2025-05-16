import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';

import 'package:madina/users/super_admin/data/repos/super_repo_impl.dart';
import 'package:madina/users/super_admin/data/sources/super_remote_data_source.dart';
part 'branchs_state.dart';

class BranchsCubit extends Cubit<BranchsState> {
  BranchsCubit() : super(BranchsInitial());

  final SuperRepoImpl _superRepoImpl = SuperRepoImpl(
    superRemoteDataSource: SuperRemoteDataSourceImpl(),
  );

  List<BranchModel> branchs = [];
 






  
  Future<void> addBranch({
    required int id,
    required String token,
    required String name,
    required String address,
  }) async {
    emit(BranchLoading());
    final data = await _superRepoImpl.addBranch(
      token: token,
      name: name,
      address: address,
      branchId: id,
    );
    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(BranchFailure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');

        emit(BranchSuccess());
      },
    );
  }

  Future<void> getBranches({required String token}) async {
    emit(BranchLoading());
    final data = await _superRepoImpl.getBranches(token: token);

    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(BranchFailure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');
        if (branchs.isEmpty) {
          branchs = data;
        }

        emit(BranchSuccess());
      },
    );
  }
}
