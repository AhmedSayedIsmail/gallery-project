part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFauild extends AuthState {
  final String errorMessage;

  LoginFauild({required this.errorMessage});
}

final class LoginSuccessfully extends AuthState {
  final LoginUserEntity loginUserEntity;

  LoginSuccessfully({required this.loginUserEntity});
}
