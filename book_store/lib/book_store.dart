



import 'package:book_store/core/helpers/app_contstants.dart';
import 'package:book_store/features/onboarding/presentation/onboarding_screen.dart';
import 'package:book_store/features/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookStore extends StatefulWidget {
   const BookStore({super.key});

  @override
  State<BookStore> createState() => _BookStoreState();
}


class _BookStoreState extends State<BookStore> {
  late final SharedPreferences? prefs;
  @override
  void initState() {
    fetchToken();
    super.initState();
  }
  fetchToken()async{
    prefs = await SharedPreferences.getInstance();

  }
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
         home:getToken()!=null?TestScreen():OnboardingScreen(),
       ),
     );
   }


   String? getToken(){

     return prefs?.getString("token");
   }
}
