import 'package:notes_app_sqflite_provider/models/notesmodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Dbhelper {
  Dbhelper._();
  static Dbhelper instance = Dbhelper._();

  Database? _db;

  static String TableName = 'notestable';
  static String idColumn = 'id';
  static String titleColumn = 'title';
  static String descriptionColumn = 'description';

  Future<Database> getDB() async{
    return _db ??= await initDB();
  }

  Future<Database> initDB() async{
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path,'notestable.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
              CREATE TABLE $TableName(
              $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
              $titleColumn TEXT,
              $descriptionColumn TEXT)
         ''');
      },);
  }

  //get all notes
  Future<List<NotesModel>> getNotes() async{
    final db = await getDB();
    List<Map<String,dynamic>> data = await db.query(TableName);
    return data.map((c) => NotesModel.fromJson(c)).toList();
  }

  //insert a note
  Future<int> insertNote(NotesModel model) async{
    final db = await getDB();
    return db.insert(TableName, model.toJson());
  }

  //delete a note
  Future<int> deleteNote(NotesModel model) async{
    final db = await getDB();
    return db.delete(TableName,where: 'id = ?',whereArgs: [model.id]);
  }

  //update a note
  Future<int> updateNote(NotesModel model) async{
    final db = await getDB();
    return db.update(TableName, model.toJson(),where: 'id = ?',whereArgs: [model.id]);
  }
}