import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key, required this.imageUrl, this.imageFit,
  });

  final String imageUrl;
  final BoxFit ? imageFit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: imageFit,
      imageUrl: imageUrl,
      //placeholder:(context,url)=>const Center(child:CustomLoadingIndicator(),) ,
      errorWidget:(context,url,error)=>const Icon(Icons.error) ,
    );
  }
}