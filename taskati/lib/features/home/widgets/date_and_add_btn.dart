

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/helpers/Navigator.dart';
import 'package:taskati/core/helpers/extentsions.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';

class DateAndAddBtn extends StatelessWidget {
  const DateAndAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(DateFormat.yMMMMd().format(DateTime.now()),style: AppTextStyle.fontStyle20Bold,)),
        InkWell(
          onTap: (){
            context.push(AddTaskScreen());

            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddTaskScreen()));
          },
          child: Container(
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
        ),

      ],
    );
  }
}