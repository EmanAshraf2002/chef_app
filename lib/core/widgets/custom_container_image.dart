import 'package:flutter/material.dart';

class CustomContainerImage extends StatelessWidget {
  const CustomContainerImage({super.key,
    required this.h, required this.w, required this.imagePathString});

  final double h;
  final double w;
  final String imagePathString;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: w,
        height: h,
        decoration:BoxDecoration(
          image:DecorationImage(
              image:AssetImage(imagePathString),
              fit: BoxFit.fill
          ),
        )
    );
  }
}
