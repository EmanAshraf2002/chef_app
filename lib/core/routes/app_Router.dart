import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/features/auth/presentation/views/login.dart';
import 'package:chef_app/features/auth/presentation/views/reset_pass.dart';
import 'package:chef_app/features/auth/presentation/views/send_code.dart';
import 'package:chef_app/features/auth/presentation/views/sign_up.dart';
import 'package:chef_app/features/home/screens/home_screen.dart';
import 'package:chef_app/features/menue/presentation/views/add_meal.dart';
import 'package:chef_app/features/menue/presentation/views/menu_home.dart';
import 'package:chef_app/features/profile/presentation/views/change_password.dart';
import 'package:chef_app/features/profile/presentation/views/profile_home.dart';
import 'package:chef_app/features/profile/presentation/views/settings.dart';
import 'package:chef_app/features/profile/presentation/views/update_profile.dart';
import 'package:chef_app/features/splash/presentaion/views/splash_screen.dart';
import 'package:chef_app/features/splash/presentaion/views/welcom_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{

 static Route? onGenerateRoute(RouteSettings routeSettings){
   switch(routeSettings.name){
     case Routes.splashScreen :
        return MaterialPageRoute(builder: (context )=>const SplashScreen());

     case Routes.welcomeScreen :
       return MaterialPageRoute(builder: (context )=>const WelcomeScreen());

     case Routes.loginScreen :
       return MaterialPageRoute(builder: (context )=>const LoginScreen());

     case Routes.signUpScreen :
       return MaterialPageRoute(builder: (context )=>const SignUpScreen());

     case Routes.sendCodeScreen :
       return MaterialPageRoute(builder: (context )=>const SendCodeScreen());

     case Routes.resetPasswordScreen :
       return MaterialPageRoute(builder: (context )=>const ResetPasswordScreen());

     case Routes.addMealScreen :
       return MaterialPageRoute(builder: (context )=>const AddMealScreen());

     case Routes.homeScreen :
       return MaterialPageRoute(builder: (context )=>const HomeScreen());

     case Routes.menuHomeScreen :
       return MaterialPageRoute(builder: (context )=> const MenuHomeScreen());

     case Routes.profileHomeScreen :
       return MaterialPageRoute(builder: (context )=>const ProfileHomeScreen());

     case Routes.updateProfileScreen:
       return MaterialPageRoute(builder: (context )=>const UpdateProfileScreen());

     case Routes.changePasswordScreen:
       return MaterialPageRoute(builder: (context )=>const ChangePasswordScreen());

     case Routes.settingsScreen :
       return MaterialPageRoute(builder: (context )=>const SettingsScreen());



   }

 }

}