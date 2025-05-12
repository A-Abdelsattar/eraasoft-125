import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormFieldWithTitle extends StatefulWidget {
   const CustomTextFormFieldWithTitle({super.key, required this.title, required this.hintText, this.controller, this.validator,
  this.isPassword=false
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
   final bool isPassword;

  @override
  State<CustomTextFormFieldWithTitle> createState() => _CustomTextFormFieldWithTitleState();
}

class _CustomTextFormFieldWithTitleState extends State<CustomTextFormFieldWithTitle> {
  bool isObscure=true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: AppTextStyle.font16Regular,),
        verticalSpace(8),
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.mainColor,
          validator: widget.validator,
          obscureText:widget.isPassword&&isObscure,
          decoration: InputDecoration(
            // suffixIcon: ,
            suffixIcon:widget.isPassword? InkWell(
                onTap: (){
              setState(() {
                isObscure=!isObscure;
              });
                },
                child: Icon(isObscure?Icons.visibility_off:Icons.visibility)):null,
            contentPadding:EdgeInsets.symmetric(horizontal: 16.w) ,
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
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
