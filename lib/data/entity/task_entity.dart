import 'package:drift/drift.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  TextColumn get task => text()();
}