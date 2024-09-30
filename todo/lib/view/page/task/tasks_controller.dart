import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:todo/database_service.dart';
import 'package:todo/view/page/task/task.dart';

class TasksController extends ChangeNotifier {
  Isar? _isar;
  List<Task> taskList = [];

  Isar get isar => _isar!;

  Future<void> initialize() async {
    _isar = await openIsar();
    await getTasks();
    notifyListeners();
  }

  Future<void> getTasks() async {
    taskList = await isar.tasks.where().sortByIsChecked().findAll();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await isar.writeTxn(
      () async {
        await isar.tasks.put(task);
      },
    );
    taskList.add(task);
    notifyListeners();
  }

  Future<void> toggleChecked(int index) async {
    isar.writeTxn(
      () async {
        await isar.tasks.put(taskList[index]);
      },
    );
    taskList[index].isChecked = !taskList[index].isChecked;

    notifyListeners();
  }

  Future<void> removeTask(Task task) async {
    isar.writeTxn(
      () async {
        await isar.tasks.delete(task.id);
      },
    );

    taskList.remove(task);
    notifyListeners();
  }

  void reorderTask(int oldIndex,int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
   final Task movedTask = taskList.removeAt(oldIndex);
   taskList.insert(newIndex, movedTask);
   notifyListeners();
  }

  String titleText() {
     final notDoneTasks = taskList.where((task) => task.isChecked == false).toList();
     if (notDoneTasks.isNotEmpty) {
       return  '${notDoneTasks.length} کار انجام نشده داری';  
     } else {
       return 'ایول هیچ کار انجام نشده ای نداری';
     }
  }

  Future<void> editTask(Task task , int index) async{
    isar.writeTxn(() async{
      await isar.tasks.put(task);
    },);

    taskList[index] = task;
    notifyListeners();
  }
}
