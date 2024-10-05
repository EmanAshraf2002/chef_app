import 'package:chef_app/features/auth/data/repositry/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());

 AuthRepository authRepository;
 TextEditingController emailController=TextEditingController();
 GlobalKey<FormState> sendCodeKey=GlobalKey<FormState>();
 GlobalKey<FormState> resetCodeKey=GlobalKey<FormState>();

 void sendCode() async{
   emit(SendCodeLoading());
   final response=await authRepository.sendCode(
       email: emailController.text
   );
   response.fold(
           (error) =>emit(SendCodeFailure(errorMessage: error)) ,
           (message) => emit(SendCodeSuccess(message: message)));

 }

  //Reset code logic
  TextEditingController codeController=TextEditingController();
  // New password textField
  TextEditingController newPasswordController=TextEditingController();

  bool isNewPasswordShowing=true;
  IconData newPassSuffixIcon=Icons.visibility;

  void changeNewPasswordSuffixIcon(){
    isNewPasswordShowing=!isNewPasswordShowing;
    newPassSuffixIcon=isNewPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangePasswordSuffixIcon());
  }

// confirm password textField
  TextEditingController confirmPasswordController=TextEditingController();

  bool isConfirmPasswordShowing=true;
  IconData confirmPassSuffixIcon=Icons.visibility;

  void changeConfirmedPasswordSuffixIcon(){
    isConfirmPasswordShowing=!isConfirmPasswordShowing;
    confirmPassSuffixIcon=isConfirmPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangePasswordConfirmationSuffixIcon());
  }

  void resetPassword() async{
    emit(ResetCodeLoading());
    final response=await authRepository.resetPassword(
        email: emailController.text,
        pass: newPasswordController.text,
        confirmPass:confirmPasswordController.text,
        code: codeController.text);
    response.fold(
            (error) =>emit(ResetCodeFailure(errorMessage: error)) ,
            (message) => emit(ResetCodeSuccess(message: message)));

  }

}
