import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:chef_app/core/widgets/custom_alertDialog.dart';
import 'package:chef_app/core/widgets/custom_cached_networkImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60.h,width: 60.w,
          child:const CustomCachedNetworkImage(
            imageFit: BoxFit.cover,
            imageUrl: "https://media.istockphoto.com/id/588595864/photo/steaming-mixed-vegetables-in-the-wok-asian-style-cooking.jpg?s=612x612&w=0&k=20&c=NZWe4QUwFmEqPAwHa3s0u3Zak6JjlRm36gMgmXx8roA=",
          ),
        ),
        SizedBox(width: 10.w,),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("title"),
            Text("Subtitle"),
            Text("Price LE"),
          ],
        ),
        const Spacer() ,
        IconButton(
            onPressed: (){
              showDialog(context: context, builder: (context){
                return CustomAlertDialog(
                    contentText:"DeleteMeal?".tr(context),
                    actions:[
                      TextButton(onPressed:(){},
                          child: Text("confirm".tr(context) ,style: AppTextStyles.font18,)),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          child: Text("cancel".tr(context),style: AppTextStyles.font18,)),
                   ],
                );
              });
        },
            icon:const Icon(Icons.cancel,color: AppColors.red,size: 35,)
        ) ,

      ],
    );
  }
}
