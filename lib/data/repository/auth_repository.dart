import 'package:dartz/dartz.dart';
import 'package:task_promina/core/models/error/error_handle.dart';
import 'package:task_promina/data/datasource/auth_remote_datasource.dart';
import 'package:task_promina/domain/entities/user_entities.dart';
import 'package:task_promina/domain/repository/base_auth_repository.dart';
import 'package:task_promina/domain/usecase/login_usecase.dart';

class AuthRepositoryImpl extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  AuthRepositoryImpl({required this.baseAuthRemoteDataSource});
  
  @override
  Future<Either<ErrorHandle, LoginUserEntity>> login(
      LoginParameter parameter) async {
    try {
      return right(await baseAuthRemoteDataSource.login(parameter));
    } on ServerException catch (error) {
      return left(ErrorHandle(message: error.message));
    }
  }
}
