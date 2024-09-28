
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  GlobalKey<FormState> loginKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isLoginPasswordShowing=true;
  IconData loginSuffixIcon=Icons.visibility;

  void changeLoginPasswordSuffixIcon(){
    isLoginPasswordShowing=!isLoginPasswordShowing;
    loginSuffixIcon=isLoginPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

}
