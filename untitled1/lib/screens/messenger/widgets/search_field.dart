


import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor:Colors.blueAccent ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        hintText: "search",
        // labelText: "search",
        hintStyle: TextStyle(
            color: Colors.grey
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
        ),


      ),
    );
  }
}
