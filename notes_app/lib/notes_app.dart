import 'package:flutter/material.dart';
import 'package:notes_app/features/home/presentaion/home_screen.dart';


class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.black,
      ),
    );
  }
}
