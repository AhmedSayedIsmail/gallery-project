import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_promina/core/base_usecase/base_usecase.dart';
import 'package:task_promina/core/models/error/error_handle.dart';
import 'package:task_promina/core/utils/constants_keys.dart';
import 'package:task_promina/domain/entities/user_entities.dart';
import 'package:task_promina/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<
    Future<Either<ErrorHandle, LoginUserEntity>>, LoginParameter> {
  final BaseAuthRepository baseAuthRepository;
  LoginUseCase({required this.baseAuthRepository});
  @override
  Future<Either<ErrorHandle, LoginUserEntity>> call(
          LoginParameter parameters) async =>
      await baseAuthRepository.login(parameters);
}

class LoginParameter extends Equatable {
  final String email;
  final String password;

  const LoginParameter({required this.email, required this.password});
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> userData = <String, dynamic>{};
    userData[ConstantsKeys.email] = email;
    userData[ConstantsKeys.password] = password;
    return userData;
  }

  @override
  List<Object?> get props => [email, password];
}
