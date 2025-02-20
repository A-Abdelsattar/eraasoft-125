

import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';

class FilterDaysRow extends StatelessWidget {
  const FilterDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
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
}


class DayContainer extends StatelessWidget {
  final bool isActive;
  const DayContainer({super.key, this.isActive=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        color:isActive? AppColors.primaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text("oct",style: AppTextStyle.fontStyle17White.copyWith(
            color: isActive? Colors.white:Colors.black
          ),),
          SizedBox(height: 10,),
          Text("30",style: AppTextStyle.fontStyle17White.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isActive? Colors.white:Colors.black
          )),
          SizedBox(height: 10,),
          Text("MON",style: AppTextStyle.fontStyle17White.copyWith(
            color: isActive? Colors.white:Colors.black
          ),)
        ],
      ),
    );
  }
}