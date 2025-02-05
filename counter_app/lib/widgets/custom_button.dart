

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onPressed;
  const CustomButton({super.key, this.onPressed, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:  ElevatedButton.styleFrom(
            fixedSize: Size(300,60),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        )
        ,onPressed:onPressed, child: Text(title,
      style: TextStyle(
          fontSize: 20,
          color: Colors.white
      ),
    ));
  }
}
