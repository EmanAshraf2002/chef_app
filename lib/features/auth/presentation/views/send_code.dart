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
import 'package:chef_app/features/auth/presentation/auth_cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(onPressed: () {
          navigate(context: context, route: Routes.loginScreen);
        }, icon: const Icon(Icons.arrow_back)
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
            listener: (context, state) {
              if(state is SendCodeSuccess)
                {
                  showToast(msg: state.message, toastStates:ToastStates.success);
                  navigate(context: context, route: Routes.resetPasswordScreen);
                }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                child: Column(
                  children: [
                    CustomContainerImage(h: 230.h, w: 230.w,
                        imagePathString: AppAssets.lock),
                    SizedBox(height: 30.h,),
                    Text("EnterYourMailAndWeWillSendYouCodeToResetYourPassword"
                        .tr(context),
                        style: AppTextStyles.font18),
                    SizedBox(height: 30.h,),
                    CustomTextFormField(
                      hintText: "EnterYourEmail".tr(context),
                      labelText: "E-mail".tr(context),
                      controller:BlocProvider.of<ForgetPasswordCubit>(context).emailController ,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@gmail.com')) {
                          return "PleaseEnterValidEmail".tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 70.h,),
                    state is SendCodeLoading?const CustomLoadingIndicator():CustomElevatedButton(
                      buttonText: "SendCode".tr(context),
                      bgColor: AppColors.primary,
                      textColor: AppColors.white,
                      height: 55.h,
                      width: 235.w,
                      onPressed: () {
                        if(BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey.
                        currentState!.validate())
                        {
                          BlocProvider.of<ForgetPasswordCubit>(context).sendCode();
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
