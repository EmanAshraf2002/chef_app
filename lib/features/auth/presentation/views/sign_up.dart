import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/features/auth/presentation/componants/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../componants/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomStack(height:180.h, titleText: "Welcome".tr(context)),
            SizedBox(
              height: 40.h,
            ),
            const SignUpBody(),
          ],
        ),
      )),
    );
  }
}


