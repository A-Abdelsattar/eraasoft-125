import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';


class CustomTextFormFieldWithTitle extends StatelessWidget {
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  const CustomTextFormFieldWithTitle({super.key, required this.title, required this.hintText, this.suffixIcon,  this.readOnly=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyle.fontStyle20Bold,),
        SizedBox(height: 10,),
        TextFormField(
          onTap:onTap ,
          readOnly: readOnly,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon:suffixIcon ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primaryColor)
              )
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}
