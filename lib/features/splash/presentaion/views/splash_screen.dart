import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen  extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToWelcomePage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body:Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 140.h,
                width:140.w,
                decoration: const BoxDecoration(
                 image: DecorationImage(
                   image:AssetImage(AppAssets.logo)

                 ),
                ),
              ),
            ),
           SizedBox(height: 12.h,),
            const Text("Chef App",style: TextStyle(color: Colors.white,
                fontSize:28,
                fontFamily: "NekroFont"
            ),
              ),
          ],
        ),
      ) ,
    );
  }

  void navigateToWelcomePage() async{
   await Future.delayed(const Duration(seconds:4)).then((value) {
     navigate(context: context, route: Routes.welcomeScreen);
   });
  }
}
