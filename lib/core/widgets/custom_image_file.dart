import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../utilis/app_assets.dart';
import 'custom_container_image.dart';

class CustomImageFile extends StatelessWidget {
  const CustomImageFile({super.key, this.image, });

  final XFile? image;
  @override
  Widget build(BuildContext context) {
    return image!=null?CircleAvatar(
      radius: 75.r,
      backgroundImage:FileImage(File(image!.path),),) :
      CustomContainerImage(imagePathString: AppAssets.dish,
            h: 110.h,
            w: 110.w,

    ) ;
  }
}
