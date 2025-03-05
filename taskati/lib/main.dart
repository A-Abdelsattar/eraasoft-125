import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/taskati_app.dart';

void main()async{
   await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
   await Hive.openBox<TaskModel>('tasks');

  runApp(const TaskatiApp());
}




