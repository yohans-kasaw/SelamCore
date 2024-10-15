import 'inventory_repository.dart';
import '../app_database.dart';

class TransactionRepository {
  final AppDatabase _db;
  final InventoryRepository _inventoryRepository;

  TransactionRepository(this._db) : _inventoryRepository = InventoryRepository(_db);

  Future<int> insert(TransactionsCompanion transaction) async {
    return _db.transaction(() async {
      try {
        // Validate buyer and seller
        final buyer = await (_db.select(_db.users)..where((tbl) => tbl.id.equals(transaction.buyerId.value)))
            .getSingleOrNull();
        final seller = await (_db.select(_db.users)..where((tbl) => tbl.id.equals(transaction.sellerId.value)))
            .getSingleOrNull();

        if (buyer == null || seller == null) {
          throw Exception('Buyer or seller not found.');
        }

        // Adjust inventory quantity
        await _inventoryRepository.adjustQuantity(transaction.inventoryId.value, -transaction.quantity.value);

        // Insert transaction
        return await _db.into(_db.transactions).insert(transaction);
      } catch (e) {
        rethrow;
      }
    });
  }

  Future<int> update(Transaction transaction) async {
    // Updating transactions might not be allowed
    throw UnimplementedError('Update operation is not supported for transactions.');
  }

  Future<int> delete(int id) async {
    // Deleting transactions might not be allowed
    throw UnimplementedError('Delete operation is not supported for transactions.');
  }

  Future<Transaction?> getById(int id) async {
    try {
      return await (_db.select(_db.transactions)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Transaction>> getAll() async {
    try {
      return await _db.select(_db.transactions).get();
    } catch (e) {
      rethrow;
    }
  }
}
