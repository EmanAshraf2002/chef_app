import 'package:chef_app/core/database/exceptions/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class BadResposneException extends ServerException {
  BadResposneException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class FetchDataException extends ServerException {
  FetchDataException(super.messageModel);
}

class BadRequestException extends ServerException {
  BadRequestException(super.messageModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.messageModel);
}
class ForbiddenException extends ServerException {
  ForbiddenException(super.messageModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.messageModel);
}

class ConflictException extends ServerException {
  ConflictException(super.messageModel);
}
class CancleExeption extends ServerException {
  CancleExeption(super.messageModel);
}


handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.badCertificate:
      throw BadCertificateException(_handleErrorModel(e));

    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(_handleErrorModel(e));

    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.sendTimeout:
      throw ServerException(_handleErrorModel(e));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw BadRequestException(_handleErrorModel(e));

        case 401: // Unauthorized
          throw UnauthorizedException(_handleErrorModel(e));

        case 403: // Forbidden
          throw ForbiddenException(_handleErrorModel(e));

        case 404: // Not Found
          throw NotFoundException(_handleErrorModel(e));

        case 504: // Gateway Timeout
          throw ServerException(ErrorModel(
            status: 504,
            errorMessage: "Server timeout. Please try again later.",
          ));

        case 409: // Conflict
          throw ConflictException(_handleErrorModel(e));

        default:
          throw ServerException(ErrorModel(
            status: e.response?.statusCode ?? 500,
            errorMessage: "Unknown error occurred",
          ));
      }

    case DioExceptionType.cancel:
      throw ServerException(ErrorModel(status: 500, errorMessage: e.toString()));

    case DioExceptionType.unknown:
      throw ServerException(ErrorModel(status: 500, errorMessage: e.toString()));
  }
}

// Helper function to handle the ErrorModel creation
ErrorModel _handleErrorModel(DioException e) {
  if (e.response?.data is String) {
    return ErrorModel(status: e.response?.statusCode ?? 500, errorMessage: e.response!.data);
  } else if (e.response?.data is Map<String, dynamic>) {
    return ErrorModel.fromJson(e.response!.data);
  } else {
    return ErrorModel(status: e.response?.statusCode ?? 500, errorMessage: "Unexpected error");
  }
}
