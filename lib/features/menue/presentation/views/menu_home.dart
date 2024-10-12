import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/features/menue/presentation/componants/menue_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MenuHomeScreen  extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding:const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomElevatedButton(
                buttonText: "AddMeal".tr(context),
                bgColor: AppColors.primary,
                textColor: AppColors.white,
                height: 55.h,
                width: 250.w,
                onPressed: (){}
              ),
              SizedBox(height: 32.h,),
              Expanded(
                child: Skeletonizer(
                  enabled: false,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context,index)=> const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:MenuItem(),
                      )
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


