import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_textStyles.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../auth_cubits/sign_up_cubit/sign_up_cubit.dart';
import '../auth_cubits/sign_up_cubit/sign_up_state.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<SignUpCubit,SignUpState>(
        builder: (context, state) {
          final signUpCubit=BlocProvider.of<SignUpCubit>(context);
          return Form(
            key: BlocProvider.of<SignUpCubit>(context).signUpKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "EnterYourName".tr(context),
                  labelText: "Name".tr(context),
                  controller:signUpCubit.nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "PleaseEnterValidName".tr(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height:22.h,
                ),
                CustomTextFormField(
                  hintText: "EnterYourPhone".tr(context),
                  labelText: "Phone".tr(context),
                  controller:signUpCubit.phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "PleaseEnterValidPhone".tr(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height:22.h,
                ),
                CustomTextFormField(
                  hintText: "EnterYourEmail".tr(context),
                  labelText: "E-mail".tr(context),
                  controller:signUpCubit.emailController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !value.contains('@gmail.com')) {
                      return "PleaseEnterValidEmail".tr(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height:22.h,
                ),
                CustomTextFormField(
                    hintText: "EnterYourPassword".tr(context),
                    labelText: "password".tr(context),
                    controller: signUpCubit.passwordController,
                    isPassword:signUpCubit.isSignUpPasswordShowing,
                    icon: signUpCubit.signupSuffixIcon,
                    suffixOnPressed: () {
                          signUpCubit.changeSignUpPasswordSuffixIcon();
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "PleaseEnterValidPassword".tr(context);
                      }
                      return null;
                    }),
                SizedBox(
                  height:22.h,
                ),
                CustomTextFormField(hintText: "ConfirmPassword".tr(context),
                    labelText: "ConfirmPassword".tr(context),
                    controller: signUpCubit.confirmPasswordController,
                    isPassword: signUpCubit.isConfirmPasswordShowing,
                    icon:signUpCubit.confirmPassSuffixIcon,
                    suffixOnPressed: () {
                      signUpCubit.changeConfirmedPasswordSuffixIcon();
                    },
                    validator: (value){
                      if(value!.isEmpty || value.length < 6 ){
                        return "PleaseEnterValidPassword".tr(context)  ;
                      }
                      if(value!=signUpCubit.passwordController.text){
                        return "PasswordsMustMatch".tr(context);
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomElevatedButton(
                  buttonText: "SignUp".tr(context),
                  bgColor: AppColors.primary,
                  textColor: AppColors.white,
                  height: 55.h,
                  width: 235.w,
                  onPressed: (){},
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AlreadyHaveAnAccount?".tr(context),
                      style: AppTextStyles.font14
                          .copyWith(color: AppColors.gray),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(
                            context: context,
                            route: Routes.loginScreen);
                      },
                      child: Text(
                        "login".tr(context),
                        style: AppTextStyles.font14.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}