import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:chef_app/core/widgets/custom_alertDialog.dart';
import 'package:chef_app/core/widgets/custom_cached_networkImage.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/features/menue/data/models/meal_model.dart';
import 'package:chef_app/features/menue/presentation/cubits/menu_cubit.dart';
import 'package:chef_app/features/menue/presentation/cubits/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key, required this.mealModel,
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60.h, width: 60.w,
          child: CustomCachedNetworkImage(
            imageFit: BoxFit.cover,
            imageUrl: mealModel.images[0],
          ),
        ),
        SizedBox(width: 10.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mealModel.name),
            SizedBox(width:180.w,
                child: Text(mealModel.description,overflow: TextOverflow.ellipsis,),),
            Text("${mealModel.price.toString()} LE"),
          ],
        ),
        const Spacer(),
        BlocConsumer<MenuCubit,MenuState>(
         listener: (context, state){
           if(state is DeleteMealSuccessState){
             BlocProvider.of<MenuCubit>(context).getChefMeals();
           }
         },
          builder: (context, state) {
            return
            IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return CustomAlertDialog(
                      contentText: "DeleteMeal?".tr(context),
                      actions: [
                        TextButton(onPressed: () {
                          BlocProvider.of<MenuCubit>(context).deleteMeal(mealModel.id);
                          Navigator.pop(context);
                        },
                            child: Text("confirm".tr(context),
                              style: AppTextStyles.font18,)),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        },
                            child: Text("cancel".tr(context),
                              style: AppTextStyles.font18,)),
                      ],
                    );
                  });
                },
                icon: const Icon(Icons.cancel, color: AppColors.red, size: 35,)
            );
          },
        ),

      ],
    );
  }
}
