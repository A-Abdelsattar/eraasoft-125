



import 'package:book_store/core/helpers/app_contstants.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/prefs_keys.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/features/onboarding/presentation/onboarding_screen.dart';
import 'package:book_store/features/splash/presentation/splash_screen.dart';
import 'package:book_store/features/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookStore extends StatelessWidget {
   const BookStore({super.key});

  @override

   @override
   Widget build(BuildContext context) {
     return ScreenUtilInit(
       designSize: const Size(375, 812),
       minTextAdapt: true,
       splitScreenMode: true,
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           fontFamily: AppConstants.appFontFamily,
           scaffoldBackgroundColor: Color(0XFFf5f5f5)
         ),
         home:startScreen(),
       ),
     );
   }

   String? getToken(){

     return SharedPrefsHelper.getData(PrefsKeys.tokenKey);
   }

  Widget startScreen(){
    if(getToken()!=null){
      return TestScreen();
    }else if(SharedPrefsHelper.getData(PrefsKeys.onBoardingIsOpened)==true){
      return SplashScreen();
    }else{
      return OnboardingScreen();
    }
   }


}
