// test/category_repository_test.dart

import 'test_db.dart';
import 'package:drift/drift.dart';
import '../../lib/datasources/local_data/app_database.dart';
import '../../lib/datasources/local_data/repository/category_repository.dart';
// Import the matcher package for isNotNull
import 'package:matcher/matcher.dart' as matcher;

import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late CategoryRepository categoryRepo;

  TestWidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized

  setUp(() {
    db = constructDb();
    categoryRepo = CategoryRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('CategoryRepository Tests', () {
    test('Insert Category', () async {
      final categoryCompanion = CategoriesCompanion(
        name: Value('Electronics'),
        description: Value(
            'All electronic items'), // Assuming there's a description field
      );
      final id = await categoryRepo.insert(categoryCompanion);
      expect(id, greaterThan(0));

      final fetchedCategory = await categoryRepo.getById(id);
      expect(fetchedCategory, matcher.isNotNull);
      expect(fetchedCategory!.name, 'Electronics');
      expect(fetchedCategory.description, 'All electronic items');
    });

    test('Insert Duplicate Category', () async {
      final duplicateCategory = CategoriesCompanion(
        name: Value('Books'),
        description: Value('All kinds of books'),
      );

      await categoryRepo.insert(duplicateCategory);
      expect(
        () async => await categoryRepo.insert(duplicateCategory),
        throwsA(
            isA<Exception>()), // Consider specifying a more precise exception
      );
    });

    test('Update Category', () async {
      // Insert initial category using CategoriesCompanion
      final initialCategory = CategoriesCompanion(
        name: Value('Furniture'),
        description: Value('Home and office furniture'),
      );
      final id = await categoryRepo.insert(initialCategory);

      // Fetch the inserted category
      var category = await categoryRepo.getById(id);
      expect(category, matcher.isNotNull);

      // Create a companion with updated fields
      final updatedCategoryCompanion = category!.copyWith(
        name: 'Home Furniture',
        description: Value('Furniture for home use'),
      );

      // Perform the update
      final rowsAffected = await categoryRepo.update(updatedCategoryCompanion);
      expect(rowsAffected, 1);

      // Fetch the updated category
      final updatedCategory = await categoryRepo.getById(id);
      expect(updatedCategory, matcher.isNotNull);
      expect(updatedCategory!.name, 'Home Furniture');
      expect(updatedCategory.description, 'Furniture for home use');
    });

    test('Delete Category', () async {
      // Insert category to be deleted
      final categoryToDelete = CategoriesCompanion(
        name: Value('Clothing'),
        description: Value('Apparel and accessories'),
      );
      final id = await categoryRepo.insert(categoryToDelete);

      // Perform the deletion
      final rowsDeleted = await categoryRepo.delete(id);
      expect(rowsDeleted, 1);

      // Verify deletion
      final deletedCategory = await categoryRepo.getById(id);
      expect(deletedCategory, matcher.isNull);
    });
  });
}
