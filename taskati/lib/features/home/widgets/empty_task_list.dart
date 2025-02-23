import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_text_style.dart';


class EmptyTaskList extends StatelessWidget {
  const EmptyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/empty_tasks.gif",height: 300,width: 300,fit: BoxFit.contain,),
        Text("Empty Tasks",style: AppTextStyle.fontStyle17White.copyWith(
          color: Colors.grey
        ),)
      ],
    );
  }
}
