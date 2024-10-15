import '../app_database.dart';

class InventoryPriceHistoryRepository {
  final AppDatabase _db;

  InventoryPriceHistoryRepository(this._db);

  Future<int> insert(InventoryPriceHistoriesCompanion history) async {
    try {
      // Ensure inventory item exists
      final item = await (_db.select(_db.inventoryItems)..where((tbl) => tbl.id.equals(history.inventoryId.value)))
          .getSingleOrNull();
      if (item == null) {
        throw Exception('Inventory item not found.');
      }

      // Ensure changedBy user exists
      final user = await (_db.select(_db.users)..where((tbl) => tbl.id.equals(history.changedBy.value)))
          .getSingleOrNull();
      if (user == null) {
        throw Exception('User not found.');
      }

      return await _db.into(_db.inventoryPriceHistories).insert(history);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> update(InventoryPriceHistorie history) async {
    // Typically, price histories are immutable after creation
    throw UnimplementedError('Update operation is not supported for price histories.');
  }

  Future<int> delete(int id) async {
    // Deleting price histories might not be allowed
    throw UnimplementedError('Delete operation is not supported for price histories.');
  }

  Future<InventoryPriceHistorie?> getById(int id) async {
    try {
      return await (_db.select(_db.inventoryPriceHistories)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<InventoryPriceHistorie>> getAll() async {
    try {
      return await _db.select(_db.inventoryPriceHistories).get();
    } catch (e) {
      rethrow;
    }
  }

  // Additional method to get price histories for an inventory item
  Future<List<InventoryPriceHistorie>> getByInventoryId(int inventoryId) async {
    try {
      return await (_db.select(_db.inventoryPriceHistories)
            ..where((tbl) => tbl.inventoryId.equals(inventoryId)))
          .get();
    } catch (e) {
      rethrow;
    }
  }
}
