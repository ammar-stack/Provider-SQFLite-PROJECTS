import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List",style: TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (_) => AlertDialog(
              actions: [
                ElevatedButton(onPressed: (){
                  
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.purple) ,child: Text("Save",style: TextStyle(color:Colors.white),)),
                ElevatedButton(onPressed: (){Navigator.pop(context);},style: ElevatedButton.styleFrom(backgroundColor: Colors.purple) ,child: Text("Exit",style: TextStyle(color:Colors.white),)),
              ],
              content: TextField(
                controller: todoController,
                decoration: InputDecoration(
                  hintText: 'Enter To Do',
                  border: OutlineInputBorder()
                ),
              ),
              title: Text("Add To Do",style: TextStyle(color: Colors.purple),),
            ));
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.add_task,color: Colors.white,),),
    );
  }
}