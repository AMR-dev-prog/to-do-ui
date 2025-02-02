import 'package:hive/hive.dart';

class ToDoDatBase{

  List toDoList = [];

  final _myBoxsy=Hive.box('boxsy');

  void creatIntailData()
  {
     toDoList = [
    ["make appp", false],
    ["make appp", false]
  ];
  }


  void LoadData(){
    toDoList=_myBoxsy.get("ToDoList");
  }

  void updateDataBase()
  {
    _myBoxsy.put("ToDoList", toDoList);
  }

}