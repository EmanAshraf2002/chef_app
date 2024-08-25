import 'package:chef_app/features/splash/splash_screen.dart';
import 'package:chef_app/features/splash/welcom_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home:WelcomeScreen(),
    );
  }
}
