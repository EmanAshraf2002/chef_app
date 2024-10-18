import 'package:chef_app/features/auth/data/repositry/auth_repos.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  AuthRepository authRepo;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  GlobalKey<FormState> signUpKey=GlobalKey<FormState>();
  bool isSignUpPasswordShowing=true;
  IconData signupSuffixIcon=Icons.visibility;

  void changeSignUpPasswordSuffixIcon(){
    isSignUpPasswordShowing=!isSignUpPasswordShowing;
    signupSuffixIcon=isSignUpPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangeSignUpPasswordSuffixIcon());
  }

  TextEditingController confirmPasswordController=TextEditingController();
  bool isConfirmPasswordShowing=true;
  IconData confirmPassSuffixIcon=Icons.visibility;

  void changeConfirmedPasswordSuffixIcon(){
    isConfirmPasswordShowing=!isConfirmPasswordShowing;
    confirmPassSuffixIcon=isConfirmPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangePasswordConfirmationSuffixIcon());
  }

}
