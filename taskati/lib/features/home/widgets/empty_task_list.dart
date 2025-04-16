import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/utils/app_text_style.dart';


class EmptyTaskList extends StatelessWidget {
  const EmptyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/empty_tasks.gif",height: 300.h,width: 300.w,fit: BoxFit.contain,),
        Text("Empty Tasks",style: AppTextStyle.fontStyle17White.copyWith(
          color: Colors.grey
        ),)
      ],
    );
  }
}
