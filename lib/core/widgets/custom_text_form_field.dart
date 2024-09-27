import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField ({super.key,required this.hintText,
    required this.labelText, required this.controller,this.isPassword=false,
    this.icon, this.suffixOnPressed,});

  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? suffixOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      cursorColor: AppColors.primary,
      decoration:InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle:TextStyle(color: AppColors.primary,fontSize: 22.sp),
        suffixIcon: IconButton(onPressed:suffixOnPressed ,icon: Icon(icon,),),
        contentPadding: EdgeInsetsDirectional.symmetric(vertical: 14.h, horizontal: 22.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:const BorderSide(color:AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:const BorderSide(color:AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), ),
      ),
    );
  }
}
