import 'package:flutter/widgets.dart';
import 'package:todo_app_sqflite_provider/Services/dbhelper.dart';
import 'package:todo_app_sqflite_provider/modals/todomodal.dart';

class Todoprovider extends ChangeNotifier{
  List<ToDoModal> data = [];

  void getToDos()async{
    data = await Dbhelper.instance.getToDos();
    notifyListeners();
  }

  void addToDos(ToDoModal modal) async{
    await Dbhelper.instance.insertToDo(modal);
    getToDos();
  }

  void deleteToDos(ToDoModal modal) async{
    await Dbhelper.instance.deleteToDo(modal);
    getToDos();
  }

  void updateToDos(ToDoModal modal) async{
    await Dbhelper.instance.updateToDo(modal);
    getToDos();
  }
}