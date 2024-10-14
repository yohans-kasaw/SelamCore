import 'package:drift/drift.dart';
import 'inventory_items.dart';
import 'users.dart';

class InventoryPriceHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get inventoryId => integer()
      .named('inventory_id')
      .customConstraint('REFERENCES inventory_items(id) NOT NULL')();
  RealColumn get oldPrice =>
      real().named('old_price').check(oldPrice.isBiggerOrEqualValue(0))();
  RealColumn get newPrice =>
      real().named('new_price').check(newPrice.isBiggerOrEqualValue(0))();
  IntColumn get changedBy =>
      integer().named('changed_by').customConstraint('REFERENCES users(id) NOT NULL')();
  DateTimeColumn get changedAt =>
      dateTime().named('changed_at').withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
}
