import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String startTime;
  @HiveField(4)
  String endTime;
  @HiveField(5)
  int backgroundColorValue;
  @HiveField(6)
  bool isComplete;

  TaskModel(
      {
        required this.title,
      required this.description,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.backgroundColorValue,
       this.isComplete=false
      });


}