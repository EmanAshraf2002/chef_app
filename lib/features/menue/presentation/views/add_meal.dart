import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/back_leading_widget.dart';
import 'package:chef_app/core/widgets/custom_container_image.dart';
import 'package:chef_app/core/widgets/custom_elevated_button.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/menue/presentation/componants/cam_gallery_dialog.dart';
import 'package:chef_app/features/menue/presentation/cubits/menu_cubit.dart';
import 'package:chef_app/features/menue/presentation/cubits/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: const BackLeadingWidget(
          routeName: Routes.homeScreen,
        ),
        title: Text(
          "AddDishToMenu".tr(context),
          style: AppTextStyles.font18.copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                final menuCubit=BlocProvider.of<MenuCubit>(context);
                return Form(
                  key: menuCubit.addToMenuKey,
                  child: Column(
                    children: [
                      //add photo of meal
                      Stack(
                        children: [
                          CustomContainerImage(
                            h: 110.h,
                            w: 110.w,
                            imagePathString: AppAssets.dish,
                          ),
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            bottom: -10,
                            end:-3,
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CamGalleryDialog(
                                          cameraOnTap: () {
                                            Navigator.pop(context);
                                            pickImage(ImageSource.camera)
                                                .then((value) => null);
                                          },
                                          galleryOnTap: () {
                                            Navigator.pop(context);
                                            pickImage(ImageSource.gallery)
                                                .then((value) => null);
                                          },
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: AppColors.black,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:40.h,
                      ),
                      //name text field
                      CustomTextFormField(
                        hintText: "EnterMealName".tr(context),
                        controller:menuCubit.mealNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "PleaseEnterMealName".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //price text field
                      CustomTextFormField(
                        hintText: "EnterMealPrice".tr(context),
                        controller:menuCubit.mealPriceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "PleaseEnterMealPrice".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //category drop item menu
                      SizedBox(
                        height:62.h,width: double.infinity,
                        child:DropdownButtonFormField(
                            isExpanded: true,
                            hint:Text("category".tr(context)),
                            value: menuCubit.selectedCategory,
                            items: menuCubit.categoryList.map((e) =>
                            DropdownMenuItem(value: e,
                              child:Text(e,style:AppTextStyles.font14,),)).toList(),
                            onChanged: (data){
                              menuCubit.changeItem(data);
                            },
                           decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide(color: AppColors.black, width:1), // Border color and width
                              borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(color:AppColors.primary, width: 1), // Border color when focused
                              borderRadius: BorderRadius.circular(8),
                              ),
                           ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //desc text field
                      CustomTextFormField(
                        hintText: "EnterMealDescription".tr(context),
                        controller:menuCubit.mealDescriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "PleaseEnterMealDescription".tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //quantity or number text field
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value:'quantity',
                                  activeColor: AppColors.primary,
                                  groupValue:menuCubit.groupVal,
                                  onChanged:(data){
                                    menuCubit.changeGroupValue(data);
                                  }
                              ),
                              Text("quantity".tr(context),),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Radio(
                                  value:'number',
                                  activeColor: AppColors.primary,
                                  groupValue:menuCubit.groupVal,
                                  onChanged:(data){
                                    menuCubit.changeGroupValue(data);
                                  }
                              ),
                              Text("number".tr(context),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height:50.h,
                      ),
                      //add to menu button
                      CustomElevatedButton(
                        buttonText: "AddToMenu".tr(context),
                        bgColor: AppColors.primary,
                        textColor: AppColors.white,
                        height: 55.h,
                        width: 235.w,
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
