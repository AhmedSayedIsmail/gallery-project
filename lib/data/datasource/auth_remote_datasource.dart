import 'package:dio/dio.dart';
import 'package:task_promina/core/models/error/error_handle.dart';
import 'package:task_promina/core/utils/constants_keys.dart';
import 'package:task_promina/core/utils/endpoints.dart';
import 'package:task_promina/data/model/user_model.dart';
import 'package:task_promina/domain/usecase/login_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<LoginUserModel> login(LoginParameter parameter);
}

class AuthRemoteDataSourceImpl extends BaseAuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl({required this.dio});
  @override
  Future<LoginUserModel> login(LoginParameter parameter) async {
    try {
      Response response = await dio.post("$baseUrl$loginEndPoint",
          queryParameters: parameter.toMap());
      if (response.statusCode == 200 &&
          response.data[ConstantsKeys.errorMessage] != null) {
        throw ServerException(
            message: response.data[ConstantsKeys.errorMessage]);
      } else {
        return LoginUserModel.fromJson(response.data);
      }
    } on DioException catch (error) {
      throw ServerException.fromDioError(error);
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }
}
