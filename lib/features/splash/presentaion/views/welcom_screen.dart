import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            top: 320.h,
            left: 60.w,
            right: 40.w,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Material(
                 type: MaterialType.transparency,
                 child: Text("WelcomeToChefApp".tr(context),
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
                  child: Text("pleaseChooseYourLanguage".tr(context),
                      style: TextStyle(color: Colors.white,
                      fontSize:20.sp,).copyWith(fontWeight: FontWeight.bold)
                  ),
                ),
                SizedBox(height: 50.h,),
               BlocBuilder<GlobalCubit,GlobalState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 SizedBox(
                                     height: 50.h,width: 120.w,
                                     child: CustomElevatedButton(buttonText:"English".tr(context) ,
                                       onPressed:(){
                                         BlocProvider.of<GlobalCubit>(context).changeLang('en');
                                       }),
                                 ),
                                 SizedBox(width: 30.w,),
                                 SizedBox(
                                     height: 50.h,width: 120.w,
                                     child: CustomElevatedButton(buttonText:"Arabic".tr(context),
                                      onPressed:(){
                                      BlocProvider.of<GlobalCubit>(context).changeLang('ar');
                                      }),
                                     ),

                               ],
                             );
                },
              )
             ],
           )
          )
        ]
      );
  }
}


