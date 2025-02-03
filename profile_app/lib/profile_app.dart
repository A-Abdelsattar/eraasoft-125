


import 'package:flutter/material.dart';
import 'package:test_app/profile_screen.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ProfileScreen(),
    );
  }
}
