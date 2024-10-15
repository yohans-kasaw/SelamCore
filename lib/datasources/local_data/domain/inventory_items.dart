import 'package:drift/drift.dart';
import 'inventory_type_enum.dart';
import 'categories.dart';
import 'users.dart';

class InventoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get categoryId => integer()
      .named('category_id')
      .customConstraint('REFERENCES categories(id) NOT NULL')();
  TextColumn get description => text().nullable()();
  IntColumn get quantity => integer()
      .withDefault(const Constant(0))
      .check(quantity.isBiggerOrEqualValue(0))();
  RealColumn get unitPrice =>
      real().named('unit_price').check(unitPrice.isBiggerOrEqualValue(0))();
  BoolColumn get isForSale =>
      boolean().named('is_for_sale').withDefault(const Constant(true))();
  BoolColumn get isLowQuality =>
      boolean().named('is_low_quality').withDefault(const Constant(false))();
  IntColumn get addedBy =>
      integer().named('added_by').customConstraint('REFERENCES users(id) NOT NULL')();
  TextColumn get type => text().map(const InventoryTypeConverter())();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
}
