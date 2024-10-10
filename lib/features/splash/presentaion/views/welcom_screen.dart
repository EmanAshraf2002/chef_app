import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/commons.dart';
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
            left: 50.w,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Material(
                 type: MaterialType.transparency,
                 child: Text("WelcomeToChefApp".tr(context),
                    style: TextStyle(
                     color: Colors.white,
                     fontSize:30.sp,
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
                SizedBox(height:64.h,),
               BlocBuilder<GlobalCubit,GlobalState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 SizedBox(
                                     height: 50.h,width: 120.w,
                                     child: CustomElevatedButton(
                                         buttonText:"English".tr(context) ,
                                         height: 50.h,width: 120.w,
                                         bgColor: AppColors.white,textColor: AppColors.black,
                                         onPressed:(){
                                         BlocProvider.of<GlobalCubit>(context).changeLang('en');
                                         navigate(context: context, route:Routes.loginScreen);
                                       }),
                                 ),
                                 SizedBox(width: 30.w,),
                                 CustomElevatedButton(
                                   buttonText:"Arabic".tr(context),
                                   height: 50.h,width: 120.w,
                                   bgColor: AppColors.white,textColor: AppColors.black,
                                   onPressed:(){
                                  BlocProvider.of<GlobalCubit>(context).changeLang('ar');
                                  navigate(context: context, route:Routes.loginScreen);
                                  },),

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


