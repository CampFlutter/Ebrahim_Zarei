import 'package:isar/isar.dart';
import 'package:todo/entity/task_entity.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;

  String? title;

  bool isChecked;
  Task({this.isChecked = false, required this.title ,});

  factory Task.fromExisting(TaskEntity taskEntity) {
    return Task(title: taskEntity.title);
  }
}
