import 'package:book_store/book_store.dart';
import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({super.key, required this.title, required this.hintText, this.controller});

  final String title;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyle.font16Regular,),
        verticalSpace(8),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.mainColor,
          decoration: InputDecoration(
            contentPadding:EdgeInsets.symmetric(horizontal: 16.w) ,
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: AppTextStyle.font16Regular.copyWith(
              fontSize: 12.sp,
              color: AppColors.borderColor
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color:AppColors.borderColor,width: 2)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color:AppColors.mainColor,width: 2)
            ),
          ),
        ),
        verticalSpace(16)
      ],
    );
  }
}
