import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider/models/notesmodel.dart';
import 'package:notes_app_sqflite_provider/pages/addoreditnote.dart';
import 'package:notes_app_sqflite_provider/providers/notesprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Notesprovider>(context);
    List<NotesModel> data = providerData.notesData;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 211, 202),
      appBar: AppBar(
        title: Text('Notes App',style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 95, 75, 14)),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(data[index].title.toString()),
                subtitle: Text(data[index].description.toString(),maxLines: 1,),
                trailing: IconButton(onPressed: (){providerData.deleteNote(NotesModel(id: data[index].id));}, icon: Icon(Icons.delete,color: Colors.red,),
                ),
                leading: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddorEditPage(usedText: 'Edit Note',isSave: false,model: NotesModel(id: data[index].id!,title: data[index].title,description: data[index].description),)));
                }, icon: Icon(Icons.edit,color: Colors.green,)),
              ),
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddorEditPage(usedText: 'Save Note',isSave: true,model: NotesModel(id: 0),)));
        },
        backgroundColor: Color.fromARGB(255, 95, 75, 14),
        child: Icon(Icons.note_add,color: Colors.white,),),
    );
  }
}