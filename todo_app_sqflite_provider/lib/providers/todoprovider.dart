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
    data.add(modal);
    notifyListeners();
    await Dbhelper.instance.insertToDo(modal);
    getToDos();
  }

  void deleteToDos(ToDoModal modal) async{
    data.removeWhere((item) => item.id == modal.id);
    notifyListeners();
    await Dbhelper.instance.deleteToDo(modal);
    getToDos();
  }

  void updateToDos(ToDoModal modal) async{
    int index = data.indexWhere((item) => item.id == modal.id);
    data[index] = modal;
    notifyListeners();
    await Dbhelper.instance.updateToDo(modal);
    getToDos();
  }
  
  bool checkbox(int num) {
    return num == 1 ? true : false;
  }
  
}