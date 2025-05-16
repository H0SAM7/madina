import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:madina/users/super_admin/data/models/job_title_model.dart';
import 'package:meta/meta.dart';

import 'package:madina/users/super_admin/data/repos/super_repo_impl.dart';
import 'package:madina/users/super_admin/data/sources/super_remote_data_source.dart';
part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());
 List<JobTitleModel> jobTitles = [];
  final SuperRepoImpl _superRepoImpl = SuperRepoImpl(
    superRemoteDataSource: SuperRemoteDataSourceImpl(),
  );

  
  Future<void> addJobTitle({
    required String token,
    required String name,
    required int branchId,
  }) async {
    emit(JobsLoading());
    final data = await _superRepoImpl.addJobTitle(
      token: token,
      name: name,
      branchId: branchId,
    );
    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(JobsFailure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');

        emit(JobsSuccess());
      },
    );
  }

  Future<void> getJobtitles({
    required String token,
    required int branchId,
  }) async {
    if (jobTitles.isEmpty) {
      emit(JobsLoading());
      final data = await _superRepoImpl.getJobtitles(
        token: token,
        branchId: branchId,
      );

      data.fold(
        (failure) {
          log(failure.errMessage.toString());
          emit(JobsFailure(errmessage: failure.errMessage.toString()));
        },
        (data) {
          log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');
          if (jobTitles.isEmpty) {
            jobTitles = data.data;
          }

          emit(JobsSuccess());
        },
      );
    }
  }

  Future<void> updateJobTitle({
    required String token,
    required String name,
    required int branchId,
    required int jobID,
  }) async {
    emit(JobsLoading());
    final data = await _superRepoImpl.updateJobTitle(
      token: token,
      name: name,
      branchId: branchId,
      jobID: jobID,
    );
    data.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(JobsFailure(errmessage: failure.errMessage.toString()));
      },
      (data) {
        log('@@@@@@@@@@@@@@@@@@@@${data.toString()}');
        jobTitles.clear();
        emit(JobsSuccess());
      },
    );
  }
}
