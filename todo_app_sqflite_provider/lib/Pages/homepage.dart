import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_sqflite_provider/modals/todomodal.dart';
import 'package:todo_app_sqflite_provider/providers/todoprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvier = Provider.of<Todoprovider>(context);

    TextEditingController todoController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 181, 226),
      appBar: AppBar(
        title: Text("To Do List",style: TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 219, 181, 226),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (_) => AlertDialog(
              actions: [
                ElevatedButton(onPressed: (){
                  todoProvier.addToDos(ToDoModal(todo: todoController.text,isdone: 0));
                  todoController.clear();
                  Navigator.pop(context);
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.purple) ,child: Text("Save",style: TextStyle(color:Colors.white),)),
                ElevatedButton(onPressed: (){
                  todoController.clear();
                  Navigator.pop(context);},style: ElevatedButton.styleFrom(backgroundColor: Colors.purple) ,child: Text("Exit",style: TextStyle(color:Colors.white),)),
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
        body: ListView.builder(
          itemCount: todoProvier.data.length,
          itemBuilder: (context,index){
            ToDoModal newdata = todoProvier.data[index];
            return Card(
              child: ListTile(
                onLongPress: () => todoProvier.deleteToDos(ToDoModal(id: todoProvier.data[index].id)),
                title: Text(newdata.todo.toString()),
                trailing: Checkbox(
                  value: newdata.isdone == 1, onChanged: (value){
                    todoProvier.updateToDos(ToDoModal(id: newdata.id,isdone: value! ? 1 : 0,todo: newdata.todo));
                  }),
                leading: CircleAvatar(
                  child: IconButton(onPressed: (){
                    todoController = TextEditingController(text: todoProvier.data[index].todo);
                    showDialog(
            context: context, 
            builder: (_) => AlertDialog(
              actions: [
                ElevatedButton(onPressed: (){
                  todoProvier.updateToDos(ToDoModal(todo: todoController.text,isdone: todoProvier.data[index].isdone,id: todoProvier.data[index].id));
                  todoController.clear();
                  Navigator.pop(context);
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.purple) ,child: Text("Edit",style: TextStyle(color:Colors.white),)),
                ElevatedButton(onPressed: (){
                  todoController.clear();
                  Navigator.pop(context);},style: ElevatedButton.styleFrom(backgroundColor: Colors.purple) ,child: Text("Exit",style: TextStyle(color:Colors.white),)),
              ],
              content: TextField(
                controller: todoController,
                decoration: InputDecoration(
                  hintText: 'Enter To Do',
                  border: OutlineInputBorder()
                ),
              ),
              title: Text("Edit To Do",style: TextStyle(color: Colors.purple),),
            ));
                  }, icon: Icon(Icons.edit,color: Colors.green,))
                ),
              ),
            );
          }),
    );
  }

  }
