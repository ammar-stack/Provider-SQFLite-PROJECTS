import 'package:flutter/cupertino.dart';
import 'package:notes_app_sqflite_provider/models/notesmodel.dart';
import 'package:notes_app_sqflite_provider/services/dbhelper.dart';

class Notesprovider extends ChangeNotifier{
  List<NotesModel> notesData = [];

  Notesprovider(){
    getNotes();
  }

  void getNotes() async{
    notesData = await Dbhelper.instance.getNotes();
    notifyListeners();
  }

  void insertNote(NotesModel model) async{
    await Dbhelper.instance.insertNote(model);
    getNotes();
  }

  void deleteNote(NotesModel model) async{
    await Dbhelper.instance.deleteNote(model);
     getNotes();
  }

  void updateNote(NotesModel model) async{
    await Dbhelper.instance.updateNote(model);
    getNotes();
  }
}