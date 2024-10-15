// test/user_repository_test.dart

import 'package:test/test.dart';
import 'test_db.dart';
import 'package:drift/drift.dart'; 
import '../../lib/datasources/local_data/app_database.dart';
import '../../lib/datasources/local_data/repository/role_repository.dart';
import '../../lib/datasources/local_data/repository/user_repository.dart';
// Import the matcher package for isNotNull
import 'package:matcher/matcher.dart' as matcher;

void main() {
  late AppDatabase db;
  late UserRepository userRepo;
  late RoleRepository roleRepo;
  late int roleId;

  setUp(() async {
    db = constructDb();
    userRepo = UserRepository(db);
    roleRepo = RoleRepository(db);

    // Insert a role to be used by users using RolesCompanion
    final roleCompanion = RolesCompanion(
      name: Value('User'),
      description: Value('Standard user role'),
    );
    roleId = await roleRepo.insert(roleCompanion);
  });

  tearDown(() async {
    await db.close();
  });

  group('UserRepository Tests', () {
    test('Insert User', () async {
      final userCompanion = UsersCompanion(
        firstName: Value('John'),
        lastName: Value('Doe'),
        email: Value('john.doe@example.com'),
        phone: Value('1234567890'),
        roleId: Value(roleId),
        passwordHash: Value('hashed_password'),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await userRepo.insert(userCompanion);
      expect(id, greaterThan(0));

      final fetchedUser = await userRepo.getById(id);
      expect(fetchedUser, matcher.isNotNull);
      expect(fetchedUser!.email, 'john.doe@example.com');
    });

    test('Insert Duplicate Email', () async {
      final user1 = UsersCompanion(
        firstName: Value('Alice'),
        lastName: Value('Smith'),
        email: Value('alice@example.com'),
        phone: Value('5551234'),
        roleId: Value(roleId),
        passwordHash: Value('password1'),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final user2 = UsersCompanion(
        firstName: Value('Alice'),
        lastName: Value('Smith'),
        email: Value('alice@example.com'), // Duplicate email
        phone: Value('5555678'),
        roleId: Value(roleId),
        passwordHash: Value('password2'),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      await userRepo.insert(user1);

      expect(
        () async => await userRepo.insert(user2),
        throwsA(isA<Exception>()),
      );
    });

    test('Update User', () async {
      final userCompanion = UsersCompanion(
        firstName: Value('Bob'),
        lastName: Value('Brown'),
        email: Value('bob@example.com'),
        phone: Value('5559876'),
        roleId: Value(roleId),
        passwordHash: Value('password'),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await userRepo.insert(userCompanion);
      var fetchedUser = await userRepo.getById(id);
      expect(fetchedUser, matcher.isNotNull);

      // Create a companion with the updated lastName
      final updatedUserCompanion = fetchedUser!.copyWith(lastName: 'Green');


      final rowsAffected = await userRepo.update(updatedUserCompanion);
      expect(rowsAffected, 1);

      final updatedUser = await userRepo.getById(id);
      expect(updatedUser, matcher.isNotNull);
      expect(updatedUser!.lastName, 'Green');
    });

    test('Delete User', () async {
      final userCompanion = UsersCompanion(
        firstName: Value('Carol'),
        lastName: Value('White'),
        email: Value('carol@example.com'),
        phone: Value('5554321'),
        roleId: Value(roleId),
        passwordHash: Value('password'),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      final id = await userRepo.insert(userCompanion);
      final rowsDeleted = await userRepo.delete(id);
      expect(rowsDeleted, 1);

      final deletedUser = await userRepo.getById(id);
      expect(deletedUser, matcher.isNull);
    });
  });
}
