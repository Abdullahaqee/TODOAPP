import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/add_todo.dart';
import 'package:hive_database/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class homescreen extends StatefulWidget{
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Box todobox = Hive.box<todo>('todo');
  // Box friendbox = Hive.box('friend');
  //
  // String? name;
  //
  // createfriend()async{
  //   await friendbox.put('name', 'Tahir');
  // }
  // addfriend()async{
  //   setState(() {
  //      name = friendbox.get('name');
  //   });
  // }
  // updatefriend()async{
  //   await friendbox.put('name', 'abdullah');
  // }
  // delete()async{
  //   await friendbox.delete('name');
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive db'),
      ),
      body: ValueListenableBuilder(
        valueListenable: todobox.listenable(),
        builder: (context,Box box,widget){
          if(box.isEmpty){
            return Center(
              child: Text('todo app'),
            );
          } else {
            return ListView.builder(
              reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index){
             todo Toda = box.getAt(index);
             return ListTile(title: Text(Toda.title,style: TextStyle(fontSize: 20,
                 fontWeight: FontWeight.bold,
               color: Toda.iscomepleted ? Colors.green : Colors.black
             ),),
               leading: Checkbox(value: Toda.iscomepleted,onChanged: (value){
                 todo Todanew = todo(title: Toda.title, iscomepleted: value!);
                 box.putAt(index, Todanew);
               }),
               trailing: IconButton(onPressed: (){
                 box.deleteAt(index);
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data is deleted')));

               }, icon: Icon(Icons.delete),),
             );
            },itemCount: box.length);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Addtodo()));
        },
      ),
      );
  }
}