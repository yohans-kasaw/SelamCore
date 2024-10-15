import 'package:drift/drift.dart';
import 'payment_method_enum.dart';

import 'inventory_price_histories.dart';
import 'users.dart';
import 'inventory_items.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNumber => text()
      .named('invoice_number')
      .withLength(min: 1, max: 50)
      .customConstraint('UNIQUE NOT NULL')();
  IntColumn get inventoryId => integer()
      .named('inventory_id')
      .customConstraint('REFERENCES inventory_items(id) NOT NULL')();
  IntColumn get quantity => integer().check(quantity.isBiggerThanValue(0))();
  RealColumn get unitPrice =>
      real().named('unit_price').check(unitPrice.isBiggerOrEqualValue(0))();
  IntColumn get unitPriceHistoryId => integer()
      .named('unit_price_history_id')
      .customConstraint('REFERENCES inventory_price_histories(id) NOT NULL')();
  RealColumn get totalPrice =>
      real().named('total_price').check(totalPrice.isBiggerOrEqualValue(0))();
  IntColumn get buyerId => integer()
      .named('buyer_id')
      .customConstraint('REFERENCES users(id) NOT NULL')();
  IntColumn get sellerId => integer()
      .named('seller_id')
      .customConstraint('REFERENCES users(id) NOT NULL')();
  TextColumn get paymentMethod =>
      text().named('payment_method').map(const PaymentMethodConverter())();
  TextColumn get description => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();
}
