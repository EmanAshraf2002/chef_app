import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/back_leading_widget.dart';
import 'package:chef_app/core/widgets/custom_container_image.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading:const BackLeadingWidget(routeName: Routes.sendCodeScreen,),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if(state is ResetCodeSuccess)
               {
                showToast(msg:state.message, toastStates:ToastStates.success);
                navigate(context: context, route: Routes.loginScreen);
              }
            },
            builder: (context, state) {
              return Form(
                key:BlocProvider.of<ForgetPasswordCubit>(context).resetCodeKey ,
                child: Column(
                  children: [
                    CustomContainerImage(h: 230.h, w: 230.w,
                        imagePathString: AppAssets.lock),
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Text("CreateNewPassword".tr(context),
                            style: AppTextStyles.font18),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    CustomTextFormField(
                        hintText: "EnterNewPassword".tr(context),
                        labelText: "NewPassword".tr(context),
                        icon:BlocProvider.of<ForgetPasswordCubit>(context).newPassSuffixIcon,
                        isPassword:BlocProvider.of<ForgetPasswordCubit>(context).isNewPasswordShowing ,
                        controller:BlocProvider.of<ForgetPasswordCubit>(context).newPasswordController,
                        suffixOnPressed: (){
                          BlocProvider.of<ForgetPasswordCubit>(context).changeNewPasswordSuffixIcon();
                        },
                        validator: (value){
                          if(value!.isEmpty || value.length < 6 ){
                            return "PleaseEnterValidPassword".tr(context)  ;
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 20.h,),
                    CustomTextFormField(hintText: "ConfirmPassword".tr(context),
                      labelText: "ConfirmPassword".tr(context),
                      icon:BlocProvider.of<ForgetPasswordCubit>(context).confirmPassSuffixIcon,
                      isPassword:BlocProvider.of<ForgetPasswordCubit>(context).isConfirmPasswordShowing ,
                      controller:BlocProvider.of<ForgetPasswordCubit>(context).confirmPasswordController,
                      suffixOnPressed: (){
                        BlocProvider.of<ForgetPasswordCubit>(context).changeConfirmedPasswordSuffixIcon();
                      },
                        validator: (value){
                          if(value!.isEmpty || value.length < 6 ){
                            return "PleaseEnterValidPassword".tr(context)  ;
                          }
                          if(value!=BlocProvider.of<ForgetPasswordCubit>(context).newPasswordController.text){
                            return "PasswordsMustMatch".tr(context);
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 20.h,),
                    CustomTextFormField(hintText: "EnterCode".tr(context),
                      labelText: "Code".tr(context),
                      controller:BlocProvider.of<ForgetPasswordCubit>(context).codeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "PleaseEnterValidCode".tr(context);
                        }
                        if (num.tryParse(value)==null) {
                          return "PleaseEnterValidCode".tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 65.h,),
                    CustomElevatedButton(
                      buttonText: "ResetPassword".tr(context),
                      bgColor: AppColors.primary,
                      textColor: AppColors.white,
                      height: 55.h,
                      width: 235.w,
                      onPressed: () {
                        if(BlocProvider.of<ForgetPasswordCubit>(context).resetCodeKey.currentState!.validate()){
                          BlocProvider.of<ForgetPasswordCubit>(context).resetPassword();
                        }
                      },
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
