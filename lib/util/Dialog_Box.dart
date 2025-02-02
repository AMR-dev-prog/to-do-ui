// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/myButton.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final Cont;
  VoidCallback onSave;
  VoidCallback onCansel;
  void onEdit;
   DialogBox({super.key,
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  required this.Cont,
  required this.onCansel,
  required this.onSave,
  onEdit
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple.shade300,
      content: SizedBox(height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          controller:Cont ,
          decoration: InputDecoration(
            
            border: const OutlineInputBorder(),
            hintText: "To Do Task",
            fillColor: Colors.deepPurple.shade100,
            filled: true,

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyButton(onPressed: onSave, text: "Save"),
            const SizedBox(width: 8), 
            MyButton(onPressed: onCansel, text: "Cansel"),
          ],
        )
      ],        
      ),),
    );
  }
}