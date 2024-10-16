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


handleDioException(e) {
  switch (e.type) {
    case DioExceptionType.badCertificate:
      throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //bad request
          throw BadRequestException(ErrorModel.fromJson(e.response!.data));

        case 401: //unauthorized
          throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));

        case 403: //forbidden
          throw ForbiddenException(ErrorModel.fromJson(e.response!.data));

        case 404: //notFound
          throw NotFoundException(ErrorModel.fromJson(e.response!.data));

        case 504: //bad request
          throw BadRequestException(ErrorModel.fromJson(e.response!.data));

        case 409: //conflict
          throw ConflictException(ErrorModel.fromJson(e.response!.data));

      // print(e.response);
      }
    case DioExceptionType.cancel:
      throw ServerException(ErrorModel(status: 500,errorMessage: e.toString()));

    case DioExceptionType.unknown:
      throw ServerException(ErrorModel(status: 500,errorMessage: e.toString()));
  // throw ServerException('badResponse');
  }
}

