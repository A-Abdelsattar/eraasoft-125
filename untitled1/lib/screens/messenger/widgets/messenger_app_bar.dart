


import 'package:flutter/material.dart';

class MessengerAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const MessengerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 50,
      leading: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle
        ),
        child: Icon(Icons.list_sharp),
      ),
      title: Text("Chats",style: TextStyle(
          fontWeight: FontWeight.bold
      ),),
      actions: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle
          ),
          child: Icon(Icons.camera_alt),
        ),
        SizedBox(width: 10,),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle
          ),
          child: Icon(Icons.edit),
        ),
        SizedBox(width: 10,),

      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}




