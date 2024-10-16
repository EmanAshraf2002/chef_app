import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/features/menue/presentation/componants/menue_item.dart';
import 'package:chef_app/features/menue/presentation/cubits/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../cubits/menu_state.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomElevatedButton(
                  buttonText: "AddMeal".tr(context),
                  bgColor: AppColors.primary,
                  textColor: AppColors.white,
                  height: 55.h,
                  width: 250.w,
                  onPressed: () {
                    navigate(context: context, route: Routes.addMealScreen);
                  }
              ),
              SizedBox(height: 32.h,),
              BlocConsumer<MenuCubit, MenuState>(
                  listener:(context, state) {
                  },
                 builder: (context, state) {
                  final menuCubit=BlocProvider.of<MenuCubit>(context);
                  return Expanded(
                    child:state is GetAllChefMealsLoadingState?const Center(child: CustomLoadingIndicator()):
                    menuCubit.meals.isEmpty?Center(child: Text("NoMealsYet".tr(context))):
                    ListView.builder(
                        itemCount: menuCubit.meals.length,
                        itemBuilder: (context, index) => Padding(
                          padding:const EdgeInsets.all(8.0),
                          child: MenuItem(mealModel: menuCubit.meals[index],),
                        )
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}


