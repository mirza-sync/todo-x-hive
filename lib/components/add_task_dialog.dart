import 'package:flutter/material.dart';

class AddTaskDialogBox extends StatelessWidget {
  final TextEditingController controller;
  const AddTaskDialogBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
