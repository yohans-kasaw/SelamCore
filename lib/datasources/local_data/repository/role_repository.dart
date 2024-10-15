import '../app_database.dart';



class RoleRepository{
  final AppDatabase _db;

  RoleRepository(this._db);

  Future<int> insert(RolesCompanion role) async {
    try {
      return await _db.into(_db.roles).insert(role);
    } catch (e) {
      // Handle exceptions, e.g., unique constraint violations
      rethrow;
    }
  }

  Future<int> update(Role role) async {
    try {
      return await (_db.update(_db.roles)..where((tbl) => tbl.id.equals(role.id)))
          .write(role.toCompanion(true));
    } catch (e) {
      rethrow;
    }
  }

  Future<int> delete(int id) async {
    try {
      return await (_db.delete(_db.roles)..where((tbl) => tbl.id.equals(id))).go();
    } catch (e) {
      rethrow;
    }
  }

  Future<Role?> getById(int id) async {
    try {
      return await (_db.select(_db.roles)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Role>> getAll() async {
    try {
      return await _db.select(_db.roles).get();
    } catch (e) {
      rethrow;
    }
  }
}
