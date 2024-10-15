// test/transaction_repository_test.dart

import 'package:test/test.dart';
import 'test_db.dart';
import 'package:drift/drift.dart';
import 'package:selam_core/datasources/local_data/app_database.dart';
import 'package:selam_core/datasources/local_data/repository/transaction_repository.dart';
import 'package:selam_core/datasources/local_data/repository/user_repository.dart';
import 'package:selam_core/datasources/local_data/repository/inventory_repository.dart';
import 'package:selam_core/datasources/local_data/repository/role_repository.dart';
import 'package:selam_core/datasources/local_data/repository/category_repository.dart';
import 'package:selam_core/datasources/local_data/domain/payment_method_enum.dart';
import 'package:selam_core/datasources/local_data/domain/inventory_type_enum.dart';


// Import the matcher package for isNotNull
import 'package:matcher/matcher.dart' as matcher;

void main() {
  late AppDatabase db;
  late TransactionRepository transactionRepo;
  late UserRepository userRepo;
  late InventoryRepository inventoryRepo;
  late RoleRepository roleRepo;
  late CategoryRepository categoryRepo;
  late int sellerId;
  late int buyerId;
  late int inventoryId;

  setUp(() async {
    db = constructDb();
    transactionRepo = TransactionRepository(db);
    userRepo = UserRepository(db);
    inventoryRepo = InventoryRepository(db);
    roleRepo = RoleRepository(db);
    categoryRepo = CategoryRepository(db);

    // Insert roles
    final sellerRoleCompanion = RolesCompanion(
      name: Value('Seller'),
      description: Value('Seller role'),
    );
    final sellerRoleId = await roleRepo.insert(sellerRoleCompanion);

    final buyerRoleCompanion = RolesCompanion(
      name: Value('Buyer'),
      description: Value('Buyer role'),
    );
    final buyerRoleId = await roleRepo.insert(buyerRoleCompanion);

    // Insert seller user
    final sellerUserCompanion = UsersCompanion(
      firstName: Value('Seller'),
      lastName: Value('User'),
      email: Value('seller@example.com'),
      phone: Value('1234567890'),
      roleId: Value(sellerRoleId),
      passwordHash: Value('hashed_password'),
    );
    sellerId = await userRepo.insert(sellerUserCompanion);

    // Insert buyer user
    final buyerUserCompanion = UsersCompanion(
      firstName: Value('Buyer'),
      lastName: Value('User'),
      email: Value('buyer@example.com'),
      phone: Value('0987654321'),
      roleId: Value(buyerRoleId),
      passwordHash: Value('hashed_password'),
    );
    buyerId = await userRepo.insert(buyerUserCompanion);

    // Insert category
    final categoryCompanion = CategoriesCompanion(
      name: Value('Electronics'),
    );
    final categoryId = await categoryRepo.insert(categoryCompanion);

    // Insert inventory item
    final inventoryCompanion = InventoryItemsCompanion(
      name: Value('Laptop'),
      categoryId: Value(categoryId),
      quantity: Value(10),
      unitPrice: Value(1000.00),
      addedBy: Value(sellerId),
      type: Value(InventoryType.EndProduct),
    );
    inventoryId = await inventoryRepo.insert(inventoryCompanion);
  });

  tearDown(() async {
    await db.close();
  });

  group('TransactionRepository Tests', () {
    test('Insert Transaction', () async {
      final transactionCompanion = TransactionsCompanion(
        invoiceNumber: Value('INV-1001'),
        inventoryId: Value(inventoryId),
        quantity: Value(2),
        unitPrice: Value(1000.00),
        unitPriceHistoryId: Value(0), // Assuming 0 for now
        totalPrice: Value(2000.00),
        buyerId: Value(buyerId),
        sellerId: Value(sellerId),
        paymentMethod: Value(PaymentMethod.Cash),
        createdAt: Value(DateTime.now()),
      );

      final id = await transactionRepo.insert(transactionCompanion);
      expect(id, greaterThan(0));

      final fetchedTransaction = await transactionRepo.getById(id);
      expect(fetchedTransaction, matcher.isNotNull);
      expect(fetchedTransaction!.invoiceNumber, 'INV-1001');

      // Verify that inventory quantity has decreased
      final inventoryItem = await inventoryRepo.getById(inventoryId);
      expect(inventoryItem!.quantity, 8);
    });

    test('Insert Transaction with insufficient inventory', () async {
      final transactionCompanion = TransactionsCompanion(
        invoiceNumber: Value('INV-1002'),
        inventoryId: Value(inventoryId),
        quantity: Value(20), // Exceeds available quantity
        unitPrice: Value(1000.00),
        unitPriceHistoryId: Value(0),
        totalPrice: Value(20000.00),
        buyerId: Value(buyerId),
        sellerId: Value(sellerId),
        paymentMethod: Value(PaymentMethod.Cash),
        createdAt: Value(DateTime.now()),
      );

      expect(
        () async => await transactionRepo.insert(transactionCompanion),
        throwsA(isA<Exception>()),
      );
    });

    test('Delete Transaction (Not Supported)', () async {
      expect(
        () async => await transactionRepo.delete(1),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
