part of 'jobs_cubit.dart';

@immutable
sealed class JobsState {}

final class JobsInitial extends JobsState {}

final class JobsLoading extends JobsState {}

final class JobsSuccess extends JobsState {}

final class JobsFailure extends JobsState {
  final String errmessage;

  JobsFailure({required this.errmessage});
}
