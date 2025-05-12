part of 'super_admin_cubit.dart';

@immutable
sealed class SuperAdminState {}

final class SuperAdminInitial extends SuperAdminState {}

final class Loading extends SuperAdminState {}

final class Success extends SuperAdminState {}

final class CitySuccess extends SuperAdminState {
  final List<CityModel> cities;

  CitySuccess({required this.cities});
}

final class Failure extends SuperAdminState {
  final String errmessage;

  Failure({required this.errmessage});
}
