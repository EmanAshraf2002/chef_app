import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({
    super.key, required this.buttonText,this.onPressed
  });

  final String buttonText;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
      child: Text(buttonText,
        style:const TextStyle(color:AppColors.black, fontSize:18,),
      ),
    );
  }
}