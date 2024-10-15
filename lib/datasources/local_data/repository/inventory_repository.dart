import '../app_database.dart';

class InventoryRepository{
  final AppDatabase _db;

  InventoryRepository(this._db);

  Future<int> insert(InventoryItemsCompanion item) async {
    try {
      // Ensure addedBy user exists
      final user = await (_db.select(_db.users)..where((tbl) => tbl.id.equals(item.addedBy.value))).getSingleOrNull();
      if (user == null) {
        throw Exception('Added by user not found.');
      }

      return await _db.into(_db.inventoryItems).insert(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> update(InventoryItem item) async {
    try {
      // Update updatedAt field
      final updatedItem = item.copyWith(updatedAt: DateTime.now());

      return await (_db.update(_db.inventoryItems)..where((tbl) => tbl.id.equals(item.id)))
          .write(updatedItem.toCompanion(true));
    } catch (e) {
      rethrow;
    }
  }

  Future<int> delete(int id) async {
    try {
      return await (_db.delete(_db.inventoryItems)..where((tbl) => tbl.id.equals(id))).go();
    } catch (e) {
      rethrow;
    }
  }

  Future<InventoryItem?> getById(int id) async {
    try {
      return await (_db.select(_db.inventoryItems)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<InventoryItem>> getAll() async {
    try {
      return await _db.select(_db.inventoryItems).get();
    } catch (e) {
      rethrow;
    }
  }

  // Additional method to adjust inventory quantity
  Future<void> adjustQuantity(int id, int adjustment) async {
    return _db.transaction(() async {
      final item = await getById(id);
      if (item == null) {
        throw Exception('Inventory item not found.');
      }

      final newQuantity = item.quantity + adjustment;
      if (newQuantity < 0) {
        throw Exception('Quantity cannot be negative.');
      }

      final updatedItem = item.copyWith(quantity: newQuantity, updatedAt: DateTime.now());

      await update(updatedItem);
    });
  }
}
