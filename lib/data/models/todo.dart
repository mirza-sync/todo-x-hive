import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  late String taskName;

  @HiveField(1)
  late bool isCompleted;

  @HiveField(2)
  late DateTime createdAt;
}
