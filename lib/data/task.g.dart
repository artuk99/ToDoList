// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final bool completed;
  final String task;
  Task({required this.id, required this.completed, required this.task});
  factory Task.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed'])!,
      task: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['completed'] = Variable<bool>(completed);
    map['task'] = Variable<String>(task);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      completed: Value(completed),
      task: Value(task),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      completed: serializer.fromJson<bool>(json['completed']),
      task: serializer.fromJson<String>(json['task']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completed': serializer.toJson<bool>(completed),
      'task': serializer.toJson<String>(task),
    };
  }

  Task copyWith({int? id, bool? completed, String? task}) => Task(
        id: id ?? this.id,
        completed: completed ?? this.completed,
        task: task ?? this.task,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('completed: $completed, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, completed, task);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.completed == this.completed &&
          other.task == this.task);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<bool> completed;
  final Value<String> task;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    this.task = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    required String task,
  }) : task = Value(task);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<bool>? completed,
    Expression<String>? task,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completed != null) 'completed': completed,
      if (task != null) 'task': task,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id, Value<bool>? completed, Value<String>? task}) {
    return TasksCompanion(
      id: id ?? this.id,
      completed: completed ?? this.completed,
      task: task ?? this.task,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('completed: $completed, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool?> completed = GeneratedColumn<bool?>(
      'completed', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completed IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String?> task = GeneratedColumn<String?>(
      'task', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, completed, task];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Task.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
