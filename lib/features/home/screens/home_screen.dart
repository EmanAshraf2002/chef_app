import 'package:chef_app/features/home/cubits/home_cubit.dart';
import 'package:chef_app/features/home/cubits/home_state.dart';
import 'package:chef_app/features/home/widgets/g_bottomNavComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body:BlocProvider.of<HomeCubit>(context).screens[BlocProvider.of<HomeCubit>(context).currentIndex] ,
          bottomNavigationBar:const GBottomNavComponent(),
        );
      },
    );
  }
}


