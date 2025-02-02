import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoUtil extends StatelessWidget {
  String TasekName;
  final bool taskComplate;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFun;
  Function(BuildContext)?EditFun;
  ToDoUtil({
    super.key,
    required this.TasekName,
    required this.taskComplate,
    required this.onChanged,
    required this.deleteFun,
    required this.EditFun
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(),
         children: [
          SlidableAction(onPressed: deleteFun,
          icon: Icons.delete,
          
          borderRadius: BorderRadius.circular(15),
          ),
           SlidableAction(onPressed: EditFun,
          icon: Icons.edit,
          
          borderRadius: BorderRadius.circular(15),
          )

        ]),
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskComplate,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                TasekName,
                style: TextStyle(
                    decoration: taskComplate
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
