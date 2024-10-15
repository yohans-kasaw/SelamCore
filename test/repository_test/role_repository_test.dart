// test/role_repository_test.dart

import 'package:test/test.dart';
import 'test_db.dart';
import 'package:drift/drift.dart'; 
import 'package:selam_core/datasources/local_data/app_database.dart';
import 'package:selam_core/datasources/local_data/repository/role_repository.dart';
// Import the matcher package for isNotNull
import 'package:matcher/matcher.dart' as matcher;

void main() {
  late AppDatabase db;
  late RoleRepository roleRepo;

  setUp(() {
    db = constructDb();
    roleRepo = RoleRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('RoleRepository Tests', () {
    test('Insert Role', () async {
      final role = RolesCompanion(
        name: Value('Tester'),
        description: Value('Testing role'),
      );
      final id = await roleRepo.insert(role);
      expect(id, greaterThan(0));

      final fetchedRole = await roleRepo.getById(id);
      expect(fetchedRole, matcher.isNotNull);
      expect(fetchedRole!.name, 'Tester');
    });

    test('Get All Roles', () async {
      await roleRepo.insert(RolesCompanion(
        name: Value('Admin'),
        description: Value('Administrator role'),
      ));
      await roleRepo.insert(RolesCompanion(
        name: Value('User'),
        description: Value('Regular user role'),
      ));

      final roles = await roleRepo.getAll();
      expect(roles.length, 2);
      expect(roles[0].name, anyOf('Admin', 'User'));
      expect(roles[1].name, anyOf('Admin', 'User'));
    });

    test('Update Role', () async {
      final insertCompanion = RolesCompanion(
        name: Value('Developer'),
        description: Value('Initial description'),
      );
      final id = await roleRepo.insert(insertCompanion);
      var role = await roleRepo.getById(id);
      expect(role, matcher.isNotNull);

      // Create a companion with the updated description
      final updatedCompanion = role!.copyWith(description: Value('Updated description'));

      final rowsAffected = await roleRepo.update(updatedCompanion);
      expect(rowsAffected, 1);

      final updatedRole = await roleRepo.getById(id);
      expect(updatedRole, matcher.isNotNull);
      expect(updatedRole!.description, 'Updated description');
    });

    test('Delete Role', () async {
      final role = RolesCompanion(
        name: Value('ToDelete'),
        description: Value('Role to be deleted'),
      );
      final id = await roleRepo.insert(role);
      final rowsDeleted = await roleRepo.delete(id);
      expect(rowsDeleted, 1);

      final deletedRole = await roleRepo.getById(id);
      expect(deletedRole, matcher.isNull);
    });

    test('Insert Duplicate Role', () async {
      final uniqueRole = RolesCompanion(
        name: Value('UniqueRole'),
        description: Value('A unique role'),
      );
      await roleRepo.insert(uniqueRole);

      final duplicateRole = RolesCompanion(
        name: Value('UniqueRole'),
        description: Value('Duplicate role attempt'),
      );

      expect(
        () async => await roleRepo.insert(duplicateRole),
        throwsA(isA<Exception>()),
      );
    });
  });
}
