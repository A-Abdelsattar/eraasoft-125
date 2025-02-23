

import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';

class TaskItem extends StatelessWidget {
  final Color? color;
  const TaskItem({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
      color:color,
      borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Flutter task-1 ",style: AppTextStyle.fontStyle20Bold.copyWith(
                  color: Colors.white
                ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.access_time,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("20:00 pm",style: AppTextStyle.fontStyle13Grey.copyWith(
                      color: Colors.white
                    ),)
                  ],
                ),
                SizedBox(height: 10,),
                Text("i will do this task",style: AppTextStyle.fontStyle17White,),
            
            
              ],
            ),
          ),
          Container(
            width: .5,
            height: 80,
            color: Colors.white,
          ),
          SizedBox(width: 10,),
          RotatedBox(quarterTurns: 3,
         child: Text("To Do",style: AppTextStyle.fontStyle17White,))

        ],
      ),
    ) ;
  }
}
