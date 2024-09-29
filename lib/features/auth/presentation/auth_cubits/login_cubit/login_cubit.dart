
import 'package:chef_app/features/auth/data/repositry/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());

  AuthRepository authRepository;
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


  login () async{
    emit(LoginLoadingState());
    final response=await authRepository.login(
        email:emailController.text,
        password: passwordController.text
    );
    response.fold(
            (errorMessage) => emit(LoginFailureState(errorMessage: errorMessage)),
            (loginModel) => emit(LoginSuccessState()) );
  }

}
