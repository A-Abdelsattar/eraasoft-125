


import 'package:flutter/material.dart';
import 'package:taskati/features/home/widgets/date_and_add_btn.dart';
import 'package:taskati/features/home/widgets/filter_days_row.dart';
import 'package:taskati/features/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Column(
            children: [
              HomeAppBar(),
              SizedBox(height: 20,),
              DateAndAddBtn(),
              SizedBox(height: 20,),
              FilterDaysRow()

            ],
          ),
        ),
      ),
    );
  }
}