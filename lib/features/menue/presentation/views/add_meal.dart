import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utilis/app_assets.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/core/widgets/back_leading_widget.dart';
import 'package:chef_app/core/widgets/custom_container_image.dart';
import 'package:chef_app/features/menue/presentation/componants/cam_gallery_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddMealScreen  extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: const BackLeadingWidget(routeName: Routes.homeScreen,),
        title: Text("AddDishToMenu".tr(context),
          style: AppTextStyles.font18.copyWith(color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //add photo of meal
                Stack(
                children:[
                  CustomContainerImage(h:150.h,w: 150.w,imagePathString: AppAssets.dish,),
                  Positioned.directional(
                     textDirection: Directionality.of(context),
                     bottom:-8,
                     end:7,

                     child:IconButton(
                         onPressed: (){
                           showDialog(context: context, builder: (context){
                             return  CamGalleryDialog(
                               cameraOnTap: () {
                                 Navigator.pop(context);
                                 pickImage(ImageSource.camera).then((value) => null);
                               },
                               galleryOnTap: () {
                                 Navigator.pop(context);
                                 pickImage(ImageSource.gallery).then((value) => null);
                               },
                             );
                           });
                         },
                         icon:const Icon(Icons.add,size:40,color: AppColors.black,)),
                 ),
                ] ,
                ),
                //name text field
                //price text field
                //category drop item menu
                //desc text field
                //quantity or number text field
                //add to menu button
              ],
            ),
          ),
        ),
      ),
    );
  }
}



