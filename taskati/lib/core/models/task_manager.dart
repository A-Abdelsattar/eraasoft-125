import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/models/task_model.dart';

//[TaskManger, TaskManger]
class TaskManager extends ChangeNotifier{
  TaskManager._(){
   _loadTasksList();
  }
  static TaskManager manager=TaskManager._();

  List<TaskModel> tasksList=[

  ];
  _loadTasksList(){
    tasksList=Hive.box<TaskModel>("tasks").values.toList();
  }

  void addTask(TaskModel task){
    tasksList.add(task);
    Hive.box<TaskModel>("tasks").add(task);

    notifyListeners();
  }
  void removeTask(index){
    tasksList.removeAt(index);
    Hive.box<TaskModel>("tasks").deleteAt(index);
    notifyListeners();

  }
}