import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/widgets/custom_container_image.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/login_cubit/login_state.dart';
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
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CustomContainerImage(
                      h: 230.h,
                      w: double.infinity,
                      imagePathString: AppAssets.loginBg),
                  Center(
                    child: Text("WelcomeBack".tr(context),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.sp,
                        ).copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
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
                            height: 18.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "ForgetPassword?".tr(context),
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          CustomElevatedButton(
                            buttonText: "login".tr(context),
                            bgColor: AppColors.primary,
                            textColor: AppColors.white,
                            height: 55.h,
                            width: 235.w,
                            onPressed: (){
                             if(BlocProvider.of<LoginCubit>(context).loginKey.currentState!.validate()){
                                print("login");
                              }

                            },
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
