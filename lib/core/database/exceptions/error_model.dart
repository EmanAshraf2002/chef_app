import 'package:chef_app/core/database/api/api_endPoints.dart';

class ErrorModel{
  final String errorMessage;
  final int status;

  ErrorModel( {required this.errorMessage ,required this.status});
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorModel(
      status: jsonData[ApiKeys.status],
      errorMessage: jsonData[ApiKeys.errorMessage],

      );

  }

}