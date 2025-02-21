/// title, description, date


class NoteModel{
  String title;
  String description;
  String date;

  NoteModel({required this.title, required this.description, required this.date});
}

List<NoteModel> notes=[
  NoteModel(title: "First", description: "des First", date: DateTime.now().toString()),
  NoteModel(title: "second", description: "des second", date: DateTime.now().toString()),
  NoteModel(title: "First", description: "des First", date: DateTime.now().toString()),
  NoteModel(title: "First", description: "des First", date: DateTime.now().toString()),
];