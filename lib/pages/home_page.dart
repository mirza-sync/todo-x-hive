import 'package:flutter/material.dart';
import 'package:todo_hive/components/TodoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo X Hive'),
        elevation: 0,
      ),
      body: ListView(
        children: const [
          TodoTile(
            taskName: 'Practice flutter',
            taskCompleted: false,
            onChanged: null,
          ),
          TodoTile(
            taskName: 'Workout',
            taskCompleted: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
