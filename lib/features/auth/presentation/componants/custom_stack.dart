import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/widgets/custom_container_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key, required this.height, required this.titleText,
  });

  final double height;
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CustomContainerImage(
            h: height,
            w: double.infinity,
            imagePathString: AppAssets.loginBg),
        Center(
          child: Text(titleText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.sp,
              ).copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}