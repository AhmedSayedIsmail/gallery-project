import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ErrorHandle extends Equatable {
  final String message;
  const ErrorHandle({required this.message});

  @override
  List<Object?> get props => [message];
}

// class ServerException implements Exception {
//   final String errorMessage;

//   ServerException({required this.errorMessage});

// }

class ServerException extends ErrorHandle {
  const ServerException({required super.message});
  factory ServerException.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerException(
            message: "Connection Timeout With Api Server");

      case DioExceptionType.sendTimeout:
        return const ServerException(message: "Send Timeout With Api Server");

      case DioExceptionType.receiveTimeout:
        return const ServerException(
            message: "Receive Timeout With Api Server");

      case DioExceptionType.badCertificate:
        return const ServerException(
            message: "Connection Timeout With Api Server");

      // I return string message because api not return failure response
      case DioExceptionType.badResponse:
        return ServerException(message: dioException.response!.data["message"]);
      case DioExceptionType.cancel:
        return const ServerException(message: "Request was canceled");
      case DioExceptionType.connectionError:
        return const ServerException(message: "No Internet Connection");
      case DioExceptionType.unknown:
        return const ServerException(
            message: 'There is a Problem,Try it Later!');
    }
  }
}
