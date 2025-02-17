


import 'package:flutter/material.dart';
import 'package:untitled1/screens/messenger/widgets/chats_list_view_horizontal.dart';
import 'package:untitled1/screens/messenger/widgets/chats_list_view_verticals.dart';
import 'package:untitled1/screens/messenger/widgets/messenger_app_bar.dart';
import 'package:untitled1/screens/messenger/widgets/search_field.dart';
class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
          child: Column(
            children: [
              MessengerAppBar(),
              SizedBox(height: 20,),
              SearchField(),
              SizedBox(height: 20,),
              ChatsListViewHorizontal(),
              ChatsListViewVerticals()
            ],
          ),
        ),

    );
  }
}
