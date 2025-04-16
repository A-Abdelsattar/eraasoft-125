import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/models/user_model.dart';
import 'package:taskati/taskati_app.dart';

void main()async{
   await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
   await Hive.openBox<TaskModel>('tasks');
   await Hive.openBox<UserModel>('user');

  runApp(const TaskatiApp());
}




