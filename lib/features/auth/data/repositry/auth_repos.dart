import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/api_endPoints.dart';
import 'package:chef_app/core/database/exceptions/handel_exception.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository{

  Future<Either<String,LoginModel>> login({
    required String email,required String password  }) async
  {
    try {
      final response= await sl<ApiConsumer>().post(
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

  Future<Either<String,String>> sendCode({required String email}) async{
    try {
      final response= await sl<ApiConsumer>().post(
        ApiEndPoints.sendCode,
        data: {
          ApiKeys.email:email
           }
      );
      return(Right(response[ApiKeys.message]));
    }
    on ServerException catch (e) {
       return(Left(e.errorModel.errorMessage));
    }

  }

  Future<Either<String,String>> resetPassword({required String email,
    required String pass,required String confirmPass, required String code}) async{
    try {
      final response= await sl<ApiConsumer>().patch(
          ApiEndPoints.changeForgottenPassword,
          data: {
            ApiKeys.email:email,
            ApiKeys.password:pass,
            ApiKeys.confirmPassword:confirmPass,
            ApiKeys.code:code,
          }
      );
      if (response != null && response.containsKey(ApiKeys.message)) {
        return Right(response[ApiKeys.message]);
      } else {
        return const Left("An unexpected error occurred. Please try again.");
      }
    }
    on ServerException catch (e) {
      return(Left(e.errorModel.errorMessage));
    }

  }


}