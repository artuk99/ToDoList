import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:task_manager/data/task.dart';

class TaskListViewModel extends ChangeNotifier {
  bool _isNewTask = false;
  bool get isNewTask => _isNewTask;
  List<Task> _tasks = [];
  List<Task> get tasks => List.unmodifiable(_tasks);

  late final AppDatabase _db;
  late final StreamSubscription _subscription;

  TaskListViewModel() {
    _db = AppDatabase();
    _subscription = _db.watchAllTask().listen((event){
      _tasks = event.reversed.toList();
      notifyListeners();
    });
  }

  void changeTaskState(bool? newValue, Task task) {
    _db.updateTask(task.copyWith(completed: newValue));
  }

  void addNewTask(String taskName) {
    _isNewTask = false;
    if (taskName.trim().isEmpty) {
      notifyListeners();
      return;
    }

    final task = TasksCompanion(
      task: drift.Value(taskName),
    );
    _db.insertTask(task);
  }

  void showTextField() {
    _isNewTask = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
