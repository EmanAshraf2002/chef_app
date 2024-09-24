import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken ),
                image:AssetImage(AppAssets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
            Positioned(
            top: 300.h,
            left: 60.w,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Material(
                 type: MaterialType.transparency,
                 child: Text("Cook Like A Chef",
                    style: TextStyle(
                     color: Colors.white,
                     fontSize:36.sp,
                     fontFamily: "NekroFont"
                 ),
                 ),
               ),
                SizedBox(height: 8.h,),
                Material(
                  type: MaterialType.transparency,
                  child: Text("please choose your language",style: TextStyle(color: Colors.white,
                  fontSize:18.sp,)),
                ),
                SizedBox(height: 30.h,),
               Row(
                 children: [
                   const CustomElevatedButton.CustomElevatedButton(buttonText: 'English',),
                   SizedBox(width: 30.w,),
                   const CustomElevatedButton.CustomElevatedButton(buttonText: 'Arabic',)

                 ],
               )
             ],
           )
          )
        ]
      );
  }
}


