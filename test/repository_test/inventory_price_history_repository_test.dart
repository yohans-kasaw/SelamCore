// test/inventory_price_history_repository_test.dart

import 'package:test/test.dart';
import 'test_db.dart';
import 'package:drift/drift.dart';

import 'package:selam_core/datasources/local_data/app_database.dart';
import 'package:selam_core/datasources/local_data/repository/category_repository.dart';
import 'package:selam_core/datasources/local_data/repository/inventory_repository.dart';
import 'package:selam_core/datasources/local_data/repository/inventory_price_history_repository.dart';
import 'package:selam_core/datasources/local_data/repository/user_repository.dart';
import 'package:selam_core/datasources/local_data/repository/role_repository.dart';
import 'package:selam_core/datasources/local_data/domain/inventory_type_enum.dart';
// Import the matcher package for isNotNull
import 'package:matcher/matcher.dart' as matcher;

void main() {
  late AppDatabase db;
  late InventoryPriceHistoryRepository priceHistoryRepo;
  late InventoryRepository inventoryRepo;
  late UserRepository userRepo;
  late RoleRepository roleRepo;
  late CategoryRepository categoryRepo;
  late int inventoryId;
  late int userId;

  setUp(() async {
    db = constructDb();
    priceHistoryRepo = InventoryPriceHistoryRepository(db);
    inventoryRepo = InventoryRepository(db);
    userRepo = UserRepository(db);
    roleRepo = RoleRepository(db);
    categoryRepo = CategoryRepository(db);

    // Insert a role
    final roleCompanion = RolesCompanion(
      name: Value('Manager'),
      description: Value('Inventory Manager'),
    );
    final roleId = await roleRepo.insert(roleCompanion);

    // Insert a user
    final userCompanion = UsersCompanion(
      firstName: Value('Price'),
      lastName: Value('Changer'),
      email: Value('price.changer@example.com'),
      phone: Value('1234567890'),
      roleId: Value(roleId),
      passwordHash: Value('hashed_password'),
    );
    userId = await userRepo.insert(userCompanion);

    // Insert a category
    final categoryCompanion = CategoriesCompanion(
      name: Value('Electronics'),
    );
    final categoryId = await categoryRepo.insert(categoryCompanion);

    // Insert an inventory item
    final inventoryCompanion = InventoryItemsCompanion(
      name: Value('Laptop'),
      categoryId: Value(categoryId),
      quantity: Value(10),
      unitPrice: Value(1000.00),
      addedBy: Value(userId),
      type: Value(InventoryType.EndProduct),
    );
    inventoryId = await inventoryRepo.insert(inventoryCompanion);
  });

  tearDown(() async {
    await db.close();
  });

  group('InventoryPriceHistoryRepository Tests', () {
    test('Insert Inventory Price History', () async {
      final priceHistoryCompanion = InventoryPriceHistoriesCompanion(
        inventoryId: Value(inventoryId),
        oldPrice: Value(1000.00),
        newPrice: Value(900.00),
        changedBy: Value(userId),
        changedAt: Value(DateTime.now()),
      );

      final id = await priceHistoryRepo.insert(priceHistoryCompanion);
      expect(id, greaterThan(0));

      final fetchedHistory = await priceHistoryRepo.getById(id);
      expect(fetchedHistory, matcher.isNotNull);
      expect(fetchedHistory!.newPrice, 900.00);
    });

    test('Insert Inventory Price History with invalid inventoryId', () async {
      final priceHistoryCompanion = InventoryPriceHistoriesCompanion(
        inventoryId: Value(9999), // Non-existent inventoryId
        oldPrice: Value(1000.00),
        newPrice: Value(950.00),
        changedBy: Value(userId),
        changedAt: Value(DateTime.now()),
      );

      expect(
        () async => await priceHistoryRepo.insert(priceHistoryCompanion),
        throwsA(isA<Exception>()),
      );
    });

    // Additional tests as needed
  });
}
