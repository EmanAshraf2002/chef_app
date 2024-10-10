import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/data/repositry/auth_repos.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/auth_cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/home/cubits/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

void initServiceLocator(){
  //auth_cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(() => HomeCubit());
  //auth features
  sl.registerLazySingleton(() => AuthRepository());
  //api features
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton(() => Dio());
  //external
  sl.registerLazySingleton(() => CacheHelper());
}