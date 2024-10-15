import '../app_database.dart';

class UserRepository{
  final AppDatabase _db;

  UserRepository(this._db);

  Future<int> insert(UsersCompanion user) async {
    try {
      // Validate email and phone uniqueness
final query = _db.select(_db.users)
  ..where((tbl) => tbl.phone.equals(user.phone.value));

final existingUser = await query.getSingleOrNull();

      if (existingUser != null) {
        throw Exception('Email or phone already in use.');
      }

      return await _db.into(_db.users).insert(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> update(User user) async {
    try {
      // Update the updatedAt field
      final updatedUser = user.copyWith(updatedAt: DateTime.now());

      return await (_db.update(_db.users)
            ..where((tbl) => tbl.id.equals(user.id)))
          .write(updatedUser.toCompanion(true));
    } catch (e) {
      rethrow;
    }
  }

  Future<int> delete(int id) async {
    try {
      return await (_db.delete(_db.users)..where((tbl) => tbl.id.equals(id)))
          .go();
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getById(int id) async {
    try {
      return await (_db.select(_db.users)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> getAll() async {
    try {
      return await _db.select(_db.users).get();
    } catch (e) {
      rethrow;
    }
  }

  // Additional methods for authentication, etc.
  Future<User?> getByEmail(String email) async {
    try {
      return await (_db.select(_db.users)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();
    } catch (e) {
      rethrow;
    }
  }
}
