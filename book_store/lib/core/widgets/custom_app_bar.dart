import 'package:book_store/book_store.dart';
import 'package:book_store/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.actions,this.withBackButton=true});
final String? title;
final List<Widget>? actions;
final bool withBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading:withBackButton? InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new,size: 18.r,),
      ):null,
      actions: actions,
      titleSpacing:0 ,
      title: Padding(
        padding:  EdgeInsets.only(left:withBackButton?0: 16.0),
        child: Text(title??"",style: AppTextStyle.font16Regular,),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}
