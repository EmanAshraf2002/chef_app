import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen  extends StatelessWidget {
  const SplashScreen({super.key});

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
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width*0.3,
                decoration: const BoxDecoration(
                 image: DecorationImage(
                   image:AssetImage(AppAssets.logo)

                 ),
                ),
              ),
            ),
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
}
