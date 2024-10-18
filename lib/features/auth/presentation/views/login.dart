import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/custom_container_image.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/login_cubit/login_state.dart';
import 'package:chef_app/features/auth/presentation/componants/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomStack(height:230.h, titleText: "WelcomeBack".tr(context),),
              SizedBox(
                height: 90.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if(state is LoginSuccessState){
                      showToast(msg:"LoginSuccessfully".tr(context), toastStates: ToastStates.success);
                      navigate(context: context, route: Routes.homeScreen);
                    }
                    if(state is LoginFailureState){
                      showToast(msg:state.errorMessage, toastStates: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText:"EnterYourEmail".tr(context),
                            labelText: "E-mail".tr(context),
                            controller:BlocProvider.of<LoginCubit>(context).emailController,
                            validator: (value){
                              if(value!.isEmpty || !value.contains('@gmail.com') ){
                                return "PleaseEnterValidEmail".tr(context) ;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomTextFormField(
                            hintText: "EnterYourPassword".tr(context),
                            labelText: "password".tr(context),
                            controller:BlocProvider.of<LoginCubit>(context).passwordController,
                            isPassword:BlocProvider.of<LoginCubit>(context).isLoginPasswordShowing,
                            icon:BlocProvider.of<LoginCubit>(context).loginSuffixIcon,
                            suffixOnPressed:(){
                            BlocProvider.of<LoginCubit>(context).changeLoginPasswordSuffixIcon();
                            } ,
                          validator: (value){
                          if(value!.isEmpty || value.length < 6 ){
                          return "PleaseEnterValidPassword".tr(context)  ;
                          }
                          return null;
                          }
                            ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigate(context: context, route: Routes.sendCodeScreen);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.gray, // Default color
                                  textStyle: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ).copyWith(
                                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.pressed)) {
                                        return AppColors.primary; // Color when pressed
                                      }
                                      return AppColors.gray; // Default color
                                    },
                                  ),
                                ),
                                child: Text(
                                  "ForgetPassword?".tr(context),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          state is LoginLoadingState?const CustomLoadingIndicator() :
                          CustomElevatedButton(
                            buttonText: "login".tr(context),
                            bgColor: AppColors.primary,
                            textColor: AppColors.white,
                            height: 55.h,
                            width: 235.w,
                            onPressed: (){
                             if(BlocProvider.of<LoginCubit>(context).loginKey.currentState!.validate()){
                               BlocProvider.of<LoginCubit>(context).login();
                              }

                            },
                          ),
                          SizedBox(
                            height: 16.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don'tHaveAnAccount?".tr(context),
                                style: AppTextStyles.font14.copyWith(color:AppColors.gray),),
                              GestureDetector(
                               onTap: (){
                                 navigate(context: context, route:Routes.signUpScreen);
                               },
                                child: Text("SignUp".tr(context),
                                    style: AppTextStyles.font14.copyWith(color:AppColors.primary,
                                      decoration: TextDecoration.underline,),
                                  ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


