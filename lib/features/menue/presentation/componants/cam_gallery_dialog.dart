import 'package:chef_app/core/locolization/app_localization.dart';
import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class CamGalleryDialog extends StatelessWidget {
  const CamGalleryDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });

  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading:const Icon(Icons.camera_alt,color: AppColors.primary,),
            title: Text("camera".tr(context)),
            onTap:cameraOnTap,
          ),
          ListTile(
            leading:const Icon(Icons.photo_library,color: AppColors.primary,),
            title: Text("gallery".tr(context)),
            onTap: galleryOnTap,
          ),

        ],
      ),
    );
  }
}
