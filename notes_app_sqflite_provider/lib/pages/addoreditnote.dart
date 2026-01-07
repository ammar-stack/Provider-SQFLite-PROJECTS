import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider/models/notesmodel.dart';
import 'package:notes_app_sqflite_provider/providers/notesprovider.dart';
import 'package:provider/provider.dart';

class AddorEditPage extends StatelessWidget {
  String? usedText;
  bool? isSave;
  NotesModel? model;
   AddorEditPage({required this.model,required this.isSave,required this.usedText,super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final providerData = Provider.of<Notesprovider>(context);
    titleController = TextEditingController(text: isSave == true ? '' : model?.title.toString());
    descriptionController = TextEditingController(text: isSave == true ? '' : model?.description.toString());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(usedText.toString(),style: TextStyle(color: Color.fromARGB(255, 95, 75, 14),fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 30,),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Descripiton',
                border: OutlineInputBorder(),
        
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                if(titleController.text == "" || descriptionController.text == ""){}
                else{
                  if(isSave == true){
                    providerData.insertNote(NotesModel(title: titleController.text,description: descriptionController.text));
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                  }
                  else{
                    providerData.updateNote(NotesModel(id: model!.id,title: titleController.text,description: descriptionController.text));
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                  }
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 95, 75, 14)
              ),
              child: Text(isSave == true ? 'Save' : "Edit",style: TextStyle(color: Colors.white),))
          ],
        )),
      ),
    );
  }
}