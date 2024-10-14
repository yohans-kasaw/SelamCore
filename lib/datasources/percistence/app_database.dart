import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:selam_core/domain/roles.dart';
import 'package:selam_core/domain/users.dart';
import 'package:selam_core/domain/categories.dart';
import 'package:selam_core/domain/inventory_items.dart';
import 'package:selam_core/domain/inventory_price_histories.dart';
import 'package:selam_core/domain/transactions.dart';
import 'package:selam_core/domain/inventory_type_enum.dart';
import 'package:selam_core/domain/payment_method_enum.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Roles,
    Categories,
    InventoryItems,
    InventoryPriceHistories,
    Transactions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
