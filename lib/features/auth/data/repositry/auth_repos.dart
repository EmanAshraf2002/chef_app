import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_endPoints.dart';
import 'package:chef_app/core/database/exceptions/handel_exception.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository{
  final ApiConsumer api;

  AuthRepository({required this.api});

  Future<Either<String,LoginModel>> login({
    required String email,required String password  }) async
  {
    try {
      final response= await api.post(
          ApiEndPoints.chefSignIn,
          data: {
            ApiKeys.email:email,
            ApiKeys.password:password
          }
      );
      final loginModel= LoginModel.fromJson(response);
      return(Right(loginModel));

    } on ServerException catch (e) {
     return(Left(e.errorModel.errorMessage));
    }

  }

}