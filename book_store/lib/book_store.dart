



import 'package:book_store/core/helpers/app_contstants.dart';
import 'package:book_store/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStore extends StatelessWidget {
   const BookStore({super.key});

   @override
   Widget build(BuildContext context) {
     return ScreenUtilInit(
       designSize: const Size(375, 812),
       minTextAdapt: true,
       splitScreenMode: true,
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           fontFamily: AppConstants.appFontFamily
         ),
         home: OnboardingScreen(),
       ),
     );
   }
 }
