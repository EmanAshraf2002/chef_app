import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/widgets/custom_GNavBar.dart';
import 'package:chef_app/features/home/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//component

class GBottomNavComponent extends StatelessWidget {
  const GBottomNavComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  CustomGBottomNavComponent(
        currentIndex:BlocProvider.of<HomeCubit>(context).currentIndex,
        onChanged:(value) {
          BlocProvider.of<HomeCubit>(context).changeIndex(value);
        },
        tabs: [
          GButton(icon: Icons.menu_book_outlined,text:"Menu".tr(context),),
          GButton(icon: Icons.person,text:"Profile".tr(context),),
        ]);
  }
}
