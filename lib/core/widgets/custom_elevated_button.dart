import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   const CustomElevatedButton({
    super.key, required this.buttonText,this.onPressed, required this.bgColor, required this.textColor, required this.height, required this.width
  });
  final Color bgColor;
  final Color textColor;
  final String buttonText;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        child: Text(buttonText,
          style:TextStyle(color:textColor, fontSize:18,),
        ),
      ),
    );
  }
}