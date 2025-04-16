

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/helpers/extentsions.dart';
import 'package:taskati/core/models/user_manager.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_strings.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/features/profile/profile_screen.dart';

class HomeAppBar extends StatelessWidget {
   HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserManager user=UserManager.instance;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(AppStrings.welcomeInHome(" Ahmed"),style: AppTextStyle.fontStyle20Bold.copyWith(
              color:AppColors.primaryColor,
            ),),
            Text("Have a nice day",style: AppTextStyle.fontStyle20Bold.copyWith(
              fontWeight: FontWeight.normal
            ),),

           
          
          ],),
          
        ),
        
          
            InkWell(
              onTap: (){
                context.push(ProfileScreen());
              },
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: Image.file(File(user.userData?.path??"")).image,
                backgroundColor: Colors.red,

              )
            ),
         
      ],
    );
  }
}

