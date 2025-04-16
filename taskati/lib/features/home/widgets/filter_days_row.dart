

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/taskati_app.dart';

class FilterDaysRow extends StatelessWidget {
  const FilterDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth>480){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DayContainer(isActive: true,),
            DayContainer(),
            DayContainer(),
            DayContainer(),
            DayContainer(),


          ],
        );
      }else{
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DayContainer(isActive: true,),
            DayContainer(),
            DayContainer(),
            DayContainer(),

          ],
        );
      }
    });
  }
}


class DayContainer extends StatelessWidget {
  final bool isActive;
  const DayContainer({super.key, this.isActive=false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
        decoration: BoxDecoration(
          color:isActive? AppColors.primaryColor:Colors.transparent,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Column(
          children: [
            Text("oct",style: AppTextStyle.fontStyle17White.copyWith(
              color: isActive? Colors.white:Colors.black
            ),),
            SizedBox(height: 10.h,),
            Text("30",style: AppTextStyle.fontStyle17White.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
              color: isActive? Colors.white:Colors.black
            )),
            SizedBox(height: 10.h,),
            Text("MON",style: AppTextStyle.fontStyle17White.copyWith(
              color: isActive? Colors.white:Colors.black
            ),)
          ],
        ),
      ),
    );
  }
}