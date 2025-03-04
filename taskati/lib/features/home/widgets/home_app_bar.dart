

import 'package:flutter/material.dart';
import 'package:taskati/core/helpers/extentsions.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_strings.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/features/profile/profile_screen.dart';

class HomeAppBar extends StatelessWidget {
   HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Text(AppStrings.welcomeInHome(" Ahmed"),style: AppTextStyle.fontStyle20Bold.copyWith(
              color:AppColors.primaryColor
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
              child: Container(
                width: 70,
                height: 70,
                  decoration: BoxDecoration(
                   border: Border.all(color: AppColors.primaryColor,width: 5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover
                      ,image: Image.network("https://img.freepik.com/free-photo/old-vintage-camera-green-grass-with-light-beams-wooden-background-top-view_1220-1113.jpg").image)
                  ),

                ),
            ),
         
      ],
    );
  }
}

