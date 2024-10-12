import 'package:chef_app/core/utilis/app_textStyles.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog  extends StatelessWidget {
  CustomAlertDialog({super.key, required this.contentText,this.actions});
  final String contentText;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      content: Text(contentText,style: AppTextStyles.font20,),
      actions: actions,
    );
  }
}
