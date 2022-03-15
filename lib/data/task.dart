import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'entity/task_entity.dart';

part 'task.g.dart';

@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  int get schemaVersion => 1;

  Future<List<Task>> getAllTask() => select(tasks).get();
  
  Stream<List<Task>> watchAllTask() => select(tasks).watch();

  Future insertTask(TasksCompanion task) => into(tasks).insert(task);

  Future updateTask(Task task) => update(tasks).replace(task);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tasks.sqlite'));
    return NativeDatabase(file);
  });
}
