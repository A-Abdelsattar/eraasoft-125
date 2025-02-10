


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';

class GenderContainer extends StatelessWidget {
  final String icon;
  final String title;
  final bool isActive;
  final void Function()? onTap;
  const GenderContainer({super.key, required this.icon, required this.title, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isActive?Colors.blueGrey : AppColors.secondaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(height: 10,),
              Text(title,style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textGrayColor
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
