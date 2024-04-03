import 'package:dartz/dartz.dart';
import 'package:task_promina/core/models/error/error_handle.dart';
import 'package:task_promina/domain/entities/user_entities.dart';
import 'package:task_promina/domain/usecase/login_usecase.dart';

abstract class BaseAuthRepository {
  Future<Either<ErrorHandle, LoginUserEntity>> login(LoginParameter parameter);
}
