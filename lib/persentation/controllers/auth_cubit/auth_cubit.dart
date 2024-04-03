import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_promina/domain/entities/user_entities.dart';
import 'package:task_promina/domain/usecase/login_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  AuthCubit({required this.loginUseCase}) : super(AuthInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static AuthCubit getCubit(context) => BlocProvider.of(context);

  Future<void> login() async {
    emit(LoginLoading());
    final result =
        await loginUseCase(LoginParameter(email: emailController.text, password: passwordController.text));
    result.fold((l) {
      log("--------------------------Login Fauiled--------------------------- ");
      emit(LoginFauild(errorMessage: l.message));
    }, (r) async {
      emit(LoginSuccessfully(loginUserEntity: r));
    });
  }
}
