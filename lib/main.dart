import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_database/homescreen.dart';
import 'package:hive_database/todo.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // registar the adaptor
  Hive.registerAdapter(todoAdapter());
  //open the new box with todo data type
  await Hive.openBox<todo>('todo');
  await Hive.openBox('friend');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homescreen(),
    );
  }
}
