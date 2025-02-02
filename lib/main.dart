import 'package:flutter/material.dart';
import 'package:flutter_application_1/_toDoPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
 await Hive.initFlutter();

var box =await Hive.openBox('boxsy');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:const ToDoPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple) ,
    );
  }
}