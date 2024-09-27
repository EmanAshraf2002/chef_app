import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/routes/app_Router.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/locolization/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) =>
          BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates:const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales:const [
                  Locale('ar', "EG"),
                  Locale('en', "US"),
                ],
                locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.loginScreen,
                onGenerateRoute: AppRouter.onGenerateRoute,
              );
            },
          ),
    );
  }
}
