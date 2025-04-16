


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_app/main.dart';
import 'package:responsive_app/test_screen.dart';

class HomeScreen extends StatelessWidget {
  const   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 200.w,
              height: 200.h,
              color: Colors.deepOrange,
              child: Text("data",style: TextStyle(
                fontSize: 16.sp
              ),),
            ),
            SizedBox(height: 20.h,),
            Container(
              width:  200.w,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.red,
              ),
            ),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context)=>Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: [
                    TextFormField()
                  ],
                ),
              ));
            }, child: Text("BottomSheet")),

          ],
        ),
      ),
    );
  }
}
