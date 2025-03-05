import 'package:flutter/material.dart';
import 'package:taskati/core/models/task_manager.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/features/home/widgets/task_item.dart';

import '../../../core/utils/app_text_style.dart';
import 'empty_task_list.dart';


class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {


    return   ListenableBuilder(listenable: TaskManager.manager, builder: (context,child){
      return Expanded(
          child:TaskManager.manager.tasksList.isEmpty?  EmptyTaskList() :ListView.builder(
              itemBuilder: (context, index) => Dismissible(key: UniqueKey(),
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.done,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Completed",style: AppTextStyle.fontStyle17White,)
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Delete",style: AppTextStyle.fontStyle17White,),

                        SizedBox(width: 10,),
                        Icon(Icons.delete_outline_outlined,color: Colors.white,),
                      ],
                    ),
                  ),
                  onDismissed:(direction){
                    if(direction==DismissDirection.startToEnd){
                      debugPrint("Completed");
                    }else{
                      TaskManager.manager.removeTask(index);

                    }
                  } ,
                  child: TaskItem(
                    task: TaskManager.manager.tasksList[index],
                  )),


              itemCount: TaskManager.manager.tasksList.length));
    });
  }
}



