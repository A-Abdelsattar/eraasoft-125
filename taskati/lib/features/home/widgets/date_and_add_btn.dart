

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/helpers/Navigator.dart';
import 'package:taskati/core/helpers/extentsions.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';

class DateAndAddBtn extends StatelessWidget {
  const DateAndAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(DateFormat.MMMMEEEEd().format(DateTime.now()),style: AppTextStyle.fontStyle20Bold,)),
        CustomButton(title: "Add Task",
        icon: Icons.add,
          onTap:( ){
            context.push(AddTaskScreen());
          },
        ),


      ],
    );
  }
}