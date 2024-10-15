import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import './domain/roles.dart';
import './domain/users.dart';
import './domain/categories.dart';
import './domain/inventory_items.dart';
import './domain/inventory_price_histories.dart';
import './domain/transactions.dart';
import './domain/inventory_type_enum.dart';
import './domain/payment_method_enum.dart';
import 'dart:math';

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
  AppDatabase(isTest) : super(_openConnection(isTest));

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(isTest) {
  return LazyDatabase(() async {
    if (isTest) {
      final randomId = Random().nextInt(100000);
      final file = await File.fromUri(Uri.file('${Directory.systemTemp.path}/test__$randomId.db')).create();
      return NativeDatabase(file);
    }
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}


