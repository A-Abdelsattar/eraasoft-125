import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/widgets/custom_text_form_field_with_title.dart';


class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({super.key});


  var formKey=GlobalKey<FormState>();
  // TextEditingController titleController=TextEditingController();
  // TextEditingController noteController=TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               CustomTextFormFieldWithTitle(
                 validator: (value){
                   if((value?.isEmpty??true)){
                     return "Title is required";
                   }
                 },
                 hintText: "Enter title here",
                 title: "Title",
                 // controller: titleController,
               ),
               CustomTextFormFieldWithTitle(
                 hintText: "Enter note here",
                 title: "Note",
                 // controller: noteController,
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
                Row(
                  children: [
                    Expanded(
            
                    child: CustomTextFormFieldWithTitle(onTap: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.now());
                    },readOnly: true,title: "Start Time", hintText: "02:22 PM")),
                    SizedBox(width: 10,),
                    Expanded(child: CustomTextFormFieldWithTitle(
                    onTap: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.now());
            
                    }
                    ,readOnly: true,title: "End Time", hintText: "02:22 PM")),
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Color",style: AppTextStyle.fontStyle20Bold,),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: 10,), CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: 10,), CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                    
                      ],
                    ),
                  ),
                  CustomButton(title: "Create Task",onTap: (){
                   if( formKey.currentState!.validate()){
                    Navigator.pop(context);
                   }
                  },)
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
