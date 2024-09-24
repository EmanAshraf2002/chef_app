import 'package:flutter/cupertino.dart';

void navigate({required BuildContext context ,required String route ,dynamic arg}){
  Navigator.pushReplacementNamed(context,route,arguments: arg);
}