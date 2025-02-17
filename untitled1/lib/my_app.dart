

import 'package:flutter/material.dart';
import 'package:untitled1/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:untitled1/screens/messenger/messenger_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BottomNavBarScreen() ,
    );
  }
}
