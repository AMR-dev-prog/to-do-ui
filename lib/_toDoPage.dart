import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/Dialog_Box.dart';
import 'package:flutter_application_1/util/data/DB.dart';
import 'package:flutter_application_1/util/todo_tile.dart';
import 'package:hive/hive.dart';

class ToDoPage extends StatefulWidget {


   const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => __toDoPageState();
}

class __toDoPageState extends State<ToDoPage> {

  final _myBoxsy=Hive.box('boxsy');

  TextEditingController myConrroller = TextEditingController();

  ToDoDatBase db=ToDoDatBase();

@override
  void initState() {
    // TODO: implement initState
      if(_myBoxsy.get("ToDoList") ==null)
      {
        db.creatIntailData();
      }else{
        db.LoadData();
      }

    super.initState();
  }


  void checkBoxChanged(bool? value, int index) {
    setState(() {
  
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask()
  {
    if(myConrroller.text.isNotEmpty){

    setState(() {
      db.toDoList.add([myConrroller.text,false]);
      myConrroller.clear();
    });
    Navigator.of(context).pop();
    }
    db.updateDataBase();

  }

  void CreatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(Cont:myConrroller ,
        onSave: saveNewTask ,
        onCansel: ()=>Navigator.of(context).pop(),
        );
      },
    );
    db.updateDataBase();

  }

  void deleteFunTask(int index){
     setState(() {
       db.toDoList.removeAt(index);
     });
    db.updateDataBase();

  }

void EditFun(int index) {
  myConrroller.text = db.toDoList[index][0]; // Pre-fill task text
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        Cont: myConrroller,
        onSave: () {
          if (myConrroller.text.isNotEmpty) {
            setState(() {
              db.toDoList[index] = [myConrroller.text, false];
              myConrroller.clear();
            });
            db.updateDataBase();
            Navigator.of(context).pop();
          }
        },
        onCansel: () {
          myConrroller.clear();
          Navigator.of(context).pop();
        },
      );
    },
  );
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        elevation: 0,
        title: const Text(
          'TO DO APP',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreatNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoUtil(
            TasekName: db.toDoList[index][0],
            taskComplate: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFun:(context) =>deleteFunTask(index) ,
            EditFun: (context) => EditFun(index),
          );
        },
      ),
    );
  }
}
