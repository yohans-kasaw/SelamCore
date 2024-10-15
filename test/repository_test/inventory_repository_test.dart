// test/inventory_repository_test.dart

import 'package:test/test.dart';
import 'test_db.dart';
import 'package:drift/drift.dart'; 
import 'package:selam_core/datasources/local_data/app_database.dart';
import 'package:selam_core/datasources/local_data/repository/category_repository.dart';
import 'package:selam_core/datasources/local_data/repository/inventory_repository.dart';
import 'package:selam_core/datasources/local_data/repository/user_repository.dart';
import 'package:selam_core/datasources/local_data/repository/role_repository.dart';
import 'package:selam_core/datasources/local_data/domain/inventory_type_enum.dart';
// Import the matcher package for isNotNull
import 'package:matcher/matcher.dart' as matcher;

void main() {
  late AppDatabase db;
  late InventoryRepository inventoryRepo;
  late CategoryRepository categoryRepo;
  late UserRepository userRepo;
  late RoleRepository roleRepo;
  late int categoryId;
  late int userId;
  late int roleId;

  setUp(() async {
    db = constructDb();
    inventoryRepo = InventoryRepository(db);
    categoryRepo = CategoryRepository(db);
    userRepo = UserRepository(db);
    roleRepo = RoleRepository(db);

    // Insert necessary dependencies using Companions
    final roleCompanion = RolesCompanion(
      name: Value('Manager'),
      description: Value('Manages inventory and users'), // Assuming there's a description field
    );
    roleId = await roleRepo.insert(roleCompanion);

    final userCompanion = UsersCompanion(
      firstName: Value('Manager'),
      lastName: Value('One'),
      email: Value('manager@example.com'),
      phone: Value('5550000'),
      roleId: Value(roleId),
      passwordHash: Value('hashed_password'), // Ensure password is hashed
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
    userId = await userRepo.insert(userCompanion);

    final categoryCompanion = CategoriesCompanion(
      name: Value('Gadgets'),
      description: Value('All kinds of gadgets'), // Assuming there's a description field
    );
    categoryId = await categoryRepo.insert(categoryCompanion);
  });

  tearDown(() async {
    await db.close();
  });

  group('InventoryRepository Tests', () {
    test('Insert Inventory Item', () async {
      final inventoryCompanion = InventoryItemsCompanion(
        name: Value('Widget'),
        categoryId: Value(categoryId),
        description: Value('A useful widget'),
        quantity: Value(100),
        unitPrice: Value(9.99),
        isForSale: Value(true),
        isLowQuality: Value(false),
        addedBy: Value(userId),
        type: Value(InventoryType.EndProduct), // Ensure enum usage is correct
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await inventoryRepo.insert(inventoryCompanion);
      expect(id, greaterThan(0));

      final fetchedItem = await inventoryRepo.getById(id);
      expect(fetchedItem, matcher.isNotNull);
      expect(fetchedItem!.name, 'Widget');
      expect(fetchedItem.description, 'A useful widget');
      expect(fetchedItem.quantity, 100);
      expect(fetchedItem.unitPrice, 9.99);
      expect(fetchedItem.isForSale, isTrue);
      expect(fetchedItem.isLowQuality, isFalse);
      expect(fetchedItem.addedBy, userId);
      expect(fetchedItem.type, InventoryType.EndProduct);
    });

    test('Adjust Quantity', () async {
      final inventoryCompanion = InventoryItemsCompanion(
        name: Value('Gizmo'),
        categoryId: Value(categoryId),
        description: Value('A versatile gizmo'),
        quantity: Value(50),
        unitPrice: Value(19.99),
        isForSale: Value(true),
        isLowQuality: Value(false),
        addedBy: Value(userId),
        type: Value(InventoryType.EndProduct),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await inventoryRepo.insert(inventoryCompanion);

      // Increase quantity by 20
      await inventoryRepo.adjustQuantity(id, 20);
      var updatedItem = await inventoryRepo.getById(id);
      expect(updatedItem!.quantity, 70);

      // Decrease quantity by 30
      await inventoryRepo.adjustQuantity(id, -30);
      updatedItem = await inventoryRepo.getById(id);
      expect(updatedItem!.quantity, 40);
    });

    test('Adjust Quantity Below Zero', () async {
      final inventoryCompanion = InventoryItemsCompanion(
        name: Value('Device'),
        categoryId: Value(categoryId),
        description: Value('An essential device'),
        quantity: Value(10),
        unitPrice: Value(29.99),
        isForSale: Value(true),
        isLowQuality: Value(false),
        addedBy: Value(userId),
        type: Value(InventoryType.EndProduct),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await inventoryRepo.insert(inventoryCompanion);

      // Attempt to decrease quantity by 15, which should fail
      expect(
        () async => await inventoryRepo.adjustQuantity(id, -15),
        throwsA(isA<Exception>()), // Consider specifying a more precise exception
      );

      // Verify that quantity remains unchanged
      final item = await inventoryRepo.getById(id);
      expect(item, matcher.isNotNull);
      expect(item!.quantity, 10);
    });

    test('Delete Inventory Item', () async {
      final inventoryCompanion = InventoryItemsCompanion(
        name: Value('Contraption'),
        categoryId: Value(categoryId),
        description: Value('A complex contraption'),
        quantity: Value(25),
        unitPrice: Value(49.99),
        isForSale: Value(true),
        isLowQuality: Value(false),
        addedBy: Value(userId),
        type: Value(InventoryType.EndProduct),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await inventoryRepo.insert(inventoryCompanion);
      final rowsDeleted = await inventoryRepo.delete(id);
      expect(rowsDeleted, 1);

      final deletedItem = await inventoryRepo.getById(id);
      expect(deletedItem, matcher.isNull);
    });

    test('Insert Duplicate Inventory Item', () async {
      final duplicateInventoryCompanion = InventoryItemsCompanion(
        name: Value('Widget'), // Assuming 'name' should be unique
        categoryId: Value(categoryId),
        description: Value('Duplicate widget'),
        quantity: Value(10),
        unitPrice: Value(9.99),
        isForSale: Value(true),
        isLowQuality: Value(false),
        addedBy: Value(userId),
        type: Value(InventoryType.EndProduct),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      await inventoryRepo.insert(duplicateInventoryCompanion);

      expect(
        () async => await inventoryRepo.insert(duplicateInventoryCompanion),
        throwsA(isA<Exception>()), // Consider specifying a more precise exception
      );
    });
  });
}
