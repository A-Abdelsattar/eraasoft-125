import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/features/home/widgets/date_and_add_btn.dart';
import 'package:taskati/features/home/widgets/empty_task_list.dart';
import 'package:taskati/features/home/widgets/filter_days_row.dart';
import 'package:taskati/features/home/widgets/home_app_bar.dart';
import 'package:taskati/features/home/widgets/task_item.dart';
import 'package:taskati/features/home/widgets/taskes_list_view.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            children: [
              HomeAppBar(),
              SizedBox(
                height: 20,
              ),
              DateAndAddBtn(),
              SizedBox(
                height: 20,
              ),
              FilterDaysRow(),
              SizedBox(
                height: 20,
              ),
           tasks?.isEmpty??false?EmptyTaskList() :TasksListView()
            ],
          ),
        ),
      ),
    );
  }
  List? tasks=[

  ];
}

