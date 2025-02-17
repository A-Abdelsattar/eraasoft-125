

import 'package:flutter/material.dart';

class ChatsListViewHorizontal extends StatelessWidget {
  const ChatsListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal
        ,itemBuilder:(context,index)=>  SizedBox(
        width: 80,
          child: Column(
          children: [
            CircleAvatar(
              radius: 40,
            ),
            SizedBox(height: 5,),
            Text("ahmed akdvn kld",maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
          ],
                ),
        ),
        itemCount: 10, separatorBuilder: (context, index) =>SizedBox(width: 10,),

      ),
    );
  }
}
