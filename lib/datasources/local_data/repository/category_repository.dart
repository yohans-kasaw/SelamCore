import '../app_database.dart';

class CategoryRepository {
  final AppDatabase _db;

  CategoryRepository(this._db);

  Future<int> insert(CategoriesCompanion category) async {
    try {
      return await _db.into(_db.categories).insert(category);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> update(Categorie category) async {
    try {
      return await (_db.update(_db.categories)..where((tbl) => tbl.id.equals(category.id)))
          .write(category.toCompanion(true));
    } catch (e) {
      rethrow;
    }
  }

  Future<int> delete(int id) async {
    try {
      return await (_db.delete(_db.categories)..where((tbl) => tbl.id.equals(id))).go();
    } catch (e) {
      rethrow;
    }
  }

  Future<Categorie?> getById(int id) async {
    try {
      return await (_db.select(_db.categories)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Categorie>> getAll() async {
    try {
      return await _db.select(_db.categories).get();
    } catch (e) {
      rethrow;
    }
  }
}
