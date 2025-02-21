import 'package:flutter/material.dart';
import 'package:notes_app/features/add_note/presentation/add_note_screen.dart';
import 'package:notes_app/features/home/data/note_model.dart';
import 'package:notes_app/features/home/presentaion/widgets/note_widget.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
         await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNoteScreen()));
        setState(() {
          print("setState");
        });
      },child: Icon(Icons.add),),
      appBar:AppBar(
        title:Text("Notes App",style: TextStyle(
          color: Colors.white
        ),) ,
        backgroundColor:Colors.blueGrey ,
        centerTitle: true,

      ),
      body: ListView.separated(itemBuilder: (context,index)=>NoteWidget(
        note: notes[index],
      ),
          separatorBuilder: (context,index)=>Divider(), itemCount: notes.length),

    );
  }
}
