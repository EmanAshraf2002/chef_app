import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_endPoints.dart';
import 'package:chef_app/core/database/api/api_interceptors.dart';
import 'package:chef_app/core/database/exceptions/handel_exception.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
 
  @override
  Future delete(
      String path,
      {dynamic data, Map<String, dynamic>? queryParams, bool isFormData = false}) async{
    
    try {
      final response=await dio.delete(
          path,
          data: isFormData?FormData.fromMap(data):data,
          queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
        handleDioException(e);
    }

  }

  @override
  Future get(
      String path,
      {dynamic data, Map<String, dynamic>? queryParams, bool isFormData = false}) async{
    try {
      final response=await dio.get(
        path,
        data: isFormData?FormData.fromMap(data):data,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }

  }

  @override
  Future patch(
      String path,
      {dynamic data, Map<String, dynamic>? queryParams, bool isFormData = false}) async{
    try {
      final response=await dio.patch(
        path,
        data: isFormData?FormData.fromMap(data):data,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }

  }

  @override
  Future post(
      String path,
      {dynamic data, Map<String, dynamic>? queryParams, bool isFormData = false}) async{
    try {
      final response=await dio.post(
        path,
        data: isFormData?FormData.fromMap(data):data,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }

  }

}

