import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/task_manager.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/widgets/custom_text_form_field_with_title.dart';


class AddTaskScreen extends StatefulWidget {
   AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey=GlobalKey<FormState>();

  TextEditingController titleController=TextEditingController();

  TextEditingController descriptionController=TextEditingController();

  TextEditingController dateController=TextEditingController();

  TextEditingController startTimeController=TextEditingController();

  TextEditingController endTimeController=TextEditingController();


   int selectedIndexColor=-1;

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
                 controller: titleController,

                 hintText: "Enter title here",
                 title: "Title",
                 // controller: titleController,
               ),
               CustomTextFormFieldWithTitle(
                 controller: descriptionController,
                 hintText: "Enter note here",
                 title: "Note",
                 // controller: noteController,
               ),
               CustomTextFormFieldWithTitle(
                 controller: dateController,
                 onTap: (){
                   showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2026,2),
                   ).then((value){
                     if(value!=null){
                       dateController.text=DateFormat("dd/MM/yyyy").format(value).toString();
                     }
                   });
                 },
                 hintText: "select date",
                 title: "Date",
                 readOnly: true,
                 suffixIcon: Icon(Icons.date_range),
               ),
                Row(
                  children: [
                    Expanded(

                    child: CustomTextFormFieldWithTitle(
                    controller: startTimeController
                    ,onTap: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.now()
                      ).then((value){
                        if(value!=null){
                          startTimeController.text=value.format(context);
                        }
                      });
                    },readOnly: true,title: "Start Time", hintText: "select start time")),
                    SizedBox(width: 10,),
                    Expanded(child: CustomTextFormFieldWithTitle(
                      controller: endTimeController,
                    onTap: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                        if(value!=null){
                          endTimeController.text=value.format(context);
                        }
                      });

                    }
                    ,readOnly: true,title: "End Time", hintText: "select end time")),
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Color",style: AppTextStyle.fontStyle20Bold,),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 45,
                          child: ListView.separated(
                          scrollDirection: Axis.horizontal
                          ,itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedIndexColor=index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: availableColors[index],
                                child:index==selectedIndexColor? Icon(Icons.done):null,
                              ),
                            );
                          }, separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount: availableColors.length),
                        )


                      ],
                    ),
                  ),
                  CustomButton(title: "Create Task",onTap: (){
                   if( formKey.currentState!.validate()){
                    if(selectedIndexColor!=-1){
                      TaskManager.manager.addTask(TaskModel(title: titleController.text,
                          description: dateController.text,
                          date: dateController.text,
                          startTime: startTimeController.text
                          , endTime: endTimeController.text,
                          backgroundColorValue: availableColors[selectedIndexColor].value));
                      Navigator.pop(context);
                    }else{
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title:Center(child: Icon(Icons.sd_card_alert_outlined,color: Colors.red,)),
                        content: Text("color is required"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("ok")),
                        ],
                      ));
                    }
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

  List<Color> availableColors=[
    Colors.blue,
    Colors.amber,
    Colors.deepOrange
  ];
}


