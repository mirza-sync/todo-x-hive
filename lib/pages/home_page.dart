import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive/components/add_task_dialog_box.dart';
import 'package:todo_hive/components/todo_tile.dart';
import 'package:todo_hive/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final todoBox = Hive.box('todoBox');
  TodoDatabase db = TodoDatabase();

  void onCheckBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
  }

  void onAddNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
     showDialog(context: context, builder: (context) {
       return AddTaskDialogBox(controller: _controller, addNewTask: onAddNewTask,);
     },);
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
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
          itemCount: db.todoList.length,
          itemBuilder: ((context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => onCheckBoxChanged(value, index),
              deleteTask: (context) => deleteTask(index),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
