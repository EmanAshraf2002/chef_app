import 'package:chef_app/core/routes/app_Router.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/features/splash/presentaion/views/splash_screen.dart';
import 'package:chef_app/features/splash/presentaion/views/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit (
      designSize:const Size(375,812),
      builder:(context,child) =>
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
