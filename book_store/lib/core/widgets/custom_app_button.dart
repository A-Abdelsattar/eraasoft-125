

import 'package:book_store/book_store.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, required this.title, this.backgroundColor, this.onTap});
  final String title;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
       color:backgroundColor?? AppColors.mainColor,
      borderRadius: BorderRadius.circular(8.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 13.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.mainColor)
          ),
          child: Text(title,style: AppTextStyle.font16SemiBold.copyWith(
            color:backgroundColor==null? Colors.white:AppColors.mainColor
          ),),
        ),
      ),
    );
  }
}
