import 'package:chef_app/app/app.dart';
import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:chef_app/features/home/cubits/home_cubit.dart';
import 'package:chef_app/features/menue/presentation/cubits/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
      MultiBlocProvider(
        providers: [
         BlocProvider( create: (context) => sl<GlobalCubit>()..getCachedLang(),),
         BlocProvider( create: (context) => sl<LoginCubit>(),),
         BlocProvider( create: (context) => sl<SignUpCubit>(),),
         BlocProvider( create: (context) => sl<ForgetPasswordCubit>(),),
         BlocProvider( create: (context) => sl<HomeCubit>(),),
         BlocProvider( create: (context) => sl<MenuCubit>()..getChefMeals(),),

        ],
        child:const MyApp(),
  ));
}


