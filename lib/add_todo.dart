import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/todo.dart';

class Addtodo extends StatefulWidget{
  const Addtodo({super.key});

  @override
  State<Addtodo> createState() => AddtodoState();
}

class AddtodoState extends State<Addtodo> {
  TextEditingController ttile = TextEditingController();
  Box todobox = Hive.box<todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          TextField(
            controller: ttile,
            decoration: const InputDecoration(
              labelText: 'title',
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              if(ttile.text != ''){
                todo newtodo = todo(title: ttile.text, iscomepleted: false);
                todobox.add(newtodo);
                Navigator.pop(context);
              }
            }, child: const Text('todo',style: TextStyle(fontSize: 20),),),
          )
        ],
      ),
      ),
    );
  }
}