import 'package:chef_app/core/database/api/api_endPoints.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/service_locator.dart';
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

  void login () async{
    emit(LoginLoadingState());
    final response=await authRepository.login(
        email:emailController.text,
        password: passwordController.text
    );
    response.fold(
            (errorMessage) => emit(LoginFailureState(errorMessage: errorMessage)),
            (loginModel) async{
              await sl<CacheHelper>().saveData(key: ApiKeys.token, value: loginModel.token);
              emit(LoginSuccessState()) ;
                    } );

  }

}
