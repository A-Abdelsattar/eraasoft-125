

import 'package:flutter/material.dart';
import 'package:notes_app/features/home/data/note_model.dart';


class AddNoteScreen extends StatelessWidget {
   AddNoteScreen({super.key});

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title:Text("Add Note",style: TextStyle(
            color: Colors.white
        ),) ,
        backgroundColor:Colors.blueGrey ,
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText:"Title" ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)

                      )
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText:"Description" ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)

                      )
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      notes.add(NoteModel(title: titleController.text, description: descriptionController.text, date: DateTime.now().toString()));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Add Note"),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
