import 'package:flutter/material.dart';
import 'package:todo_hive/components/TodoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['Practice flutter', false],
    ['Workout', true],
  ];

  void onCheckBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo X Hive'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: ((context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => onCheckBoxChanged(value, index),
            );
          }),
        ),
      ),
    );
  }
}
