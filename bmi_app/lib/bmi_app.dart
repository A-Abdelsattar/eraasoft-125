

import 'package:flutter/material.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/messenger_screen.dart';


class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessengerScreen(),
    );
  }
}
