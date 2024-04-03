import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_promina/core/services/dio_helper.dart';
import 'package:task_promina/data/datasource/auth_remote_datasource.dart';
import 'package:task_promina/data/repository/auth_repository.dart';
import 'package:task_promina/domain/repository/base_auth_repository.dart';
import 'package:task_promina/domain/usecase/login_usecase.dart';
import 'package:task_promina/persentation/controllers/auth_cubit/auth_cubit.dart';
import 'package:task_promina/persentation/controllers/upload_image_cubit/upload_image_cubit.dart';

GetIt sl = GetIt.instance;

class DependancyInjection {
  Future<void> init() async {
    //Bloc
    sl.registerFactory(() => AuthCubit(loginUseCase: sl()));

    sl.registerFactory(() => UploadImageCubit());

    //UseCase
    sl.registerLazySingleton(
      () => LoginUseCase(baseAuthRepository: sl()),
    );
    //Repository
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepositoryImpl(baseAuthRemoteDataSource: sl()));

    ///Data Source
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl()));

    //External
    // Dio
    final Dio dio = DioFactory.getDio();
    sl.registerLazySingleton(() => dio);
  }
}
