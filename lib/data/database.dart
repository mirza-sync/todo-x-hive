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
}