import 'package:drift/drift.dart';

import 'roles.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstName =>
      text().named('first_name').withLength(min: 1, max: 50)();

  TextColumn get lastName =>
      text().named('last_name').withLength(min: 1, max: 50)();

  TextColumn get email =>
      text().withLength(min: 1, max: 100).customConstraint('UNIQUE NOT NULL')();

  TextColumn get phone =>
      text().withLength(min: 1, max: 20).customConstraint('UNIQUE NOT NULL')();

  TextColumn get address => text().nullable().withLength(min: 0, max: 255)();

  IntColumn get roleId => integer().customConstraint('REFERENCES roles(id) NOT NULL')();

  TextColumn get passwordHash =>
      text().named('password_hash').withLength(min: 1, max: 255)();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
}
