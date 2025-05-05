part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure({required this.errMessage});
}

final class AuthLoading extends AuthState {}


final class AuthloginSuccess extends AuthState {
  final String token;
  final String usertype;

  AuthloginSuccess({required this.token, required this.usertype});
}


