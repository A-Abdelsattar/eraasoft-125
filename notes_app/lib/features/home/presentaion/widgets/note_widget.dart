


import 'package:flutter/material.dart';
import 'package:notes_app/features/home/data/note_model.dart';

class NoteWidget extends StatelessWidget {
 final NoteModel note;
  const NoteWidget({super.key,required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(note.title),
      subtitle: Text(note.description),
      trailing: Text(note.date),
    );
  }
}
