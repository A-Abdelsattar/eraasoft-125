import 'package:book_store/core/helpers/app_contstants.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/prefs_keys.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/features/bottom_nav_bar/presentation/bottom_nav_bar_screen.dart';
import 'package:book_store/features/create_account/cubit/create_account_cubit.dart';
import 'package:book_store/features/create_account/presentation/create_account_screen.dart';
import 'package:book_store/features/home/presentation/home_screen.dart';
import 'package:book_store/features/login/cubit/login_cubit.dart';
import 'package:book_store/features/login/presentation/login_screen.dart';
import 'package:book_store/features/onboarding/presentation/onboarding_screen.dart';
import 'package:book_store/features/splash/presentation/splash_screen.dart';
import 'package:book_store/features/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        routes: {
          "/Onboarding": (context) => OnboardingScreen(),
          "/bottomNav":(context)=>BottomNavBarScreen(),
          "/splash": (context) => SplashScreen(),
          "/login": (context) =>
              BlocProvider(
                create: (context) => LoginCubit(),
                child: LoginScreen(),
              ),
          "/createAccount": (context) =>
              BlocProvider(
                create: (context) => CreateAccountCubit(),
                child: CreateAccountScreen(),
              ),
          "/home": (context) => HomeScreen()
        },
        initialRoute: startScreen(),

        // home:startScreen(),
      ),
    );
  }

  String? getToken() {
    return SharedPrefsHelper.getData(PrefsKeys.tokenKey);
  }

  String startScreen() {
    if (getToken() != null) {
      return "/bottomNav";
    } else
    if (SharedPrefsHelper.getData(PrefsKeys.onBoardingIsOpened) == true) {
      return "/splash";
    } else {
      return "/Onboarding";
    }
  }


}

