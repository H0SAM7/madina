part of 'branchs_cubit.dart';

@immutable
sealed class BranchsState {}

final class BranchsInitial extends BranchsState {}

final class BranchLoading extends BranchsState {}

final class BranchSuccess extends BranchsState {


}


final class BranchFailure extends BranchsState {
  final String errmessage;

  BranchFailure({required this.errmessage});
}
