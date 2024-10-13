import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'app_colors.dart';

void navigate({required BuildContext context ,required String route ,dynamic arg}){
  Navigator.pushReplacementNamed(context,route,arguments: arg);
}

void showToast({required String msg,required ToastStates toastStates}) async
{
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(toastStates),
      textColor: Colors.white,
      fontSize: 14.0.sp
  );

}
enum ToastStates{success,error,warning}

Color getColor(ToastStates toastStates)
{
  switch (toastStates)
  {
    case ToastStates.success:
      return AppColors.primary;
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.warning:
      return AppColors.primary;
  }
}

Future<XFile?> pickImage(ImageSource source) async{
  XFile? image= await ImagePicker().pickImage(source: source);
  if(image!=null){
    return image;
  }
  return null;

}