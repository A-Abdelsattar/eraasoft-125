import 'package:flutter/material.dart';

import '../core/app_colors.dart';



class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: AppColors.secondaryColor,
        centerTitle:true,
        leading: Center(
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text("home",style: TextStyle(
              color: Colors.white
            ),),
          ),
        ),
        title: Text("BMI Calculator",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white
          ),
        ),
      ),

    );
  }
}
