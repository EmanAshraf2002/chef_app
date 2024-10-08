import 'package:chef_app/core/database/api/api_endPoints.dart';

class LoginModel{
  final String message;
  final String token;

  LoginModel({required this.message,required this.token,});

  factory LoginModel.fromJson(Map<String , dynamic> jsonData){
    return LoginModel(
       message: jsonData[ApiKeys.message]??'Unknown email',
       token: jsonData[ApiKeys.token]??'Unknown email',
    );
  }
}