import 'package:dio/dio.dart';
import 'package:learning_system/core/errors/error_model.dart';
import 'package:learning_system/core/errors/exceptions.dart';

void HandleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      ErrorModel err =
          ErrorModel(httpStatusCode: 500, message: 'connectionTimeout');
      throw ServerException(errorModel: err);
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      final error = ErrorModel(message: 'connection Error');
      throw ServerException(errorModel: error);
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad request
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 422: //Unprocessable Entity
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 504: //Server exception
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 500: //valdiation error
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
