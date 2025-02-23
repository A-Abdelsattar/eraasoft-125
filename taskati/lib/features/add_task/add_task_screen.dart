import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/features/add_task/widgets/custom_text_form_field_with_title.dart';


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryColor
        ),
        centerTitle: true,
        title: Text("Add Task",style: AppTextStyle.fontStyle20Bold.copyWith(
          color: AppColors.primaryColor
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           CustomTextFormFieldWithTitle(
             hintText: "Enter title here",
             title: "Title",
           ),
           CustomTextFormFieldWithTitle(
             hintText: "Enter note here",
             title: "Note",
           ),
           CustomTextFormFieldWithTitle(
             onTap: (){
               showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2026,2),


               );

             },
             hintText: "12/2/2020",
             title: "Date",
             readOnly: true,
             suffixIcon: Icon(Icons.date_range),
           ),
          ],
        ),
      ),
    );
  }
}
