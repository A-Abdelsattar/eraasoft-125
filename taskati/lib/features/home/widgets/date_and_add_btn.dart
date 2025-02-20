

import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';

class DateAndAddBtn extends StatelessWidget {
  const DateAndAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text("October 30, 2021\nToday",style: AppTextStyle.fontStyle20Blod,)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          decoration: BoxDecoration(
            color :AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(children: [
            Icon(Icons.add,color: Colors.white,size: 18,),
            Text('Add Task',style: AppTextStyle.fontStyle17White,)
          ],),
        ),

      ],
    );
  }
}