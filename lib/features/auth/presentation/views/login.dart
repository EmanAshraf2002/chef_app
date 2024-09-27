import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen  extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 230.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:AssetImage(AppAssets.loginBg),
                        fit: BoxFit.fill
                      ),
                  )
                  ),
                  Center(
                    child: Text("WelcomeBack".tr(context),
                        style:TextStyle(
                        color: Colors.white,
                        fontSize:26.sp,).copyWith(fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CustomTextFormField(hintText:"EnterYourEmail".tr(context),
                      labelText:"E-mail".tr(context),
                      controller: TextEditingController(),),
                    SizedBox(
                      height: 30.h,),
                    CustomTextFormField(
                      hintText:"EnterYourPassword".tr(context) ,
                      labelText:"password".tr(context),
                      controller:TextEditingController(),
                      isPassword: true,
                      icon: Icons.remove_red_eye,
                    ),
                    SizedBox(
                      height: 18.h,),
                    Row(
                      children: [
                        Text("ForgetPassword".tr(context) ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,),
                    SizedBox( width: 250.w,height: 60.h,
                        child: CustomElevatedButton(buttonText:"login".tr(context) ,
                          bgColor:AppColors.primary,
                          textColor: AppColors.white,
                        )),


                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
