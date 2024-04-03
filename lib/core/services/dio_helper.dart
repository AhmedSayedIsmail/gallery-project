import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? _dio;

  DioFactory._();

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (_dio == null) {
      log("----------------------Dio-----------------");
      _dio = Dio();
       _dio! ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
       addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }
   static void addDioInterceptor() {
     _dio?.interceptors.add(
       PrettyDioLogger(
         requestBody: true,
         requestHeader: true,
         responseHeader: true,
       ),
     );
   }
}
