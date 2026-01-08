import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app_sqflite_provider/modals/todomodal.dart';

class Dbhelper {
  Dbhelper._();
  static Dbhelper instance = Dbhelper._();

  Database? _db;

  static String TableName = 'todotable';
  static String idColumn = 'id';
  static String todoColumn = 'todo';
  static String isDoneColumn = 'isdone';

  Future<Database> getDB() async{
    return _db ??= await initDB();
  }

  Future<Database> initDB() async{
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path,'todo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
               CREATE TABLE $TableName(
               $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
               $todoColumn TEXT,
               $isDoneColumn INTEGER)
           ''');
      },);
  }

  //get all todos
  Future<List<ToDoModal>> getToDos() async{
    final db = await getDB();
    List<Map<String,dynamic>> data = await db.query(TableName);
    return data.map((c) => ToDoModal.fromJson(c)).toList();
  }

  //insert a todo
  Future<int> insertToDo(ToDoModal modal) async{
    final db = await getDB();
    return db.insert(TableName, modal.toJson());
  }

  //delete to do
  Future<int> deleteToDo(ToDoModal modal) async{
    final db = await getDB();
    return db.delete(TableName,where: 'id = ?',whereArgs: [modal.id]);
  }

  //update a todo
  Future<int> updateToDo(ToDoModal modal) async{
    final db = await getDB();
    return db.update(TableName, modal.toJson(),where: 'id = ?',whereArgs: [modal.id]);
  }
}