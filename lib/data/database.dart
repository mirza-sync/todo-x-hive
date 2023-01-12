import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];

  final todoBox = Hive.box('todoBox');

  void createInitialData() {
    todoList = [
      ['Workout', false],
      ['Practice Flutter', false],
    ];
  }

  void loadData() {
    todoList = todoBox.get("TODOLIST");
  }

  void updateData() {
    todoBox.put("TODOLIST", todoList);
    print('Updated!');
  }
}