


import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_images.dart';
import 'package:taskati/core/utils/app_strings.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,children: [
          Image.asset(AppImages.logoSplashImage
          ),
           Text(AppStrings.appName,style:AppTextStyle.fontStyle20Bold,),
          const SizedBox(height: 10,),
          Text(AppStrings.splashDescription,style: AppTextStyle.fontStyle13Grey)
        ],),
      ),
    );
  }


  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      // if (!mounted) return; // Check if the widget is still in the tree
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
    });
  }

}