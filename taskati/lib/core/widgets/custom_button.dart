import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';


class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final String title;
  const CustomButton({super.key, this.onTap, this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        decoration: BoxDecoration(
            color :AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center
        ,children: [
          if(icon!=null)
          Icon(icon,color: Colors.white,size: 18,),
          Text(title,style: AppTextStyle.fontStyle17White,)
        ],),
      ),
    );
  }
}
