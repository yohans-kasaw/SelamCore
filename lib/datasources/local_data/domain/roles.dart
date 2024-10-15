// roles.dart

import 'package:drift/drift.dart';

@DataClassName('Role')
class Roles extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name =>
      text().withLength(min: 1, max: 50).customConstraint('UNIQUE NOT NULL')();

  TextColumn get description => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
}
