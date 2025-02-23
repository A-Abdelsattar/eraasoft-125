import 'package:flutter/material.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';

class NavigatorHelper{

  static  pushNewScreen(context, Widget newScreen ) {
    return Navigator.push(context, MaterialPageRoute(builder: (_)=>newScreen));
  }


  }