import 'package:flutter/material.dart';

class AddTaskDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback addNewTask;
  const AddTaskDialogBox(
      {super.key, required this.controller, required this.addNewTask});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 100,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Type a new task...'),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            controller.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            addNewTask();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
