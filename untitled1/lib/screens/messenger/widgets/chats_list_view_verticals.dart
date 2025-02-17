

import 'package:flutter/material.dart';

class ChatsListViewVerticals extends StatelessWidget {
  const ChatsListViewVerticals({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(itemBuilder: (context,index)=>
        Row(children: [
        CircleAvatar(radius: 40,),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
            Text(names[index],maxLines: 1,overflow: TextOverflow.ellipsis,),
            Text("message, 11:20",maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],),
        )
              ],), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: names.length),
    );
  }
}

List names=["ahmed","ali","mahmed","mohamed","nada","salma","sara","souad","tarek","youssef"];