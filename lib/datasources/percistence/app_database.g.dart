// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RolesTable extends Roles with TableInfo<$RolesTable, Role> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<Role> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Role(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RolesTable createAlias(String alias) {
    return $RolesTable(attachedDatabase, alias);
  }
}

class Role extends DataClass implements Insertable<Role> {
  final int id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Role(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Role.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Role(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Role copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Role copyWithCompanion(RolesCompanion data) {
    return Role(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Role(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Role &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RolesCompanion extends UpdateCompanion<Role> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RolesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RolesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Role> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RolesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return RolesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
      'role_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES roles(id) NOT NULL');
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        lastName,
        email,
        phone,
        address,
        roleId,
        passwordHash,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role_id'])!,
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? address;
  final int roleId;
  final String passwordHash;
  final DateTime createdAt;
  final DateTime updatedAt;
  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      this.address,
      required this.roleId,
      required this.passwordHash,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['role_id'] = Variable<int>(roleId);
    map['password_hash'] = Variable<String>(passwordHash);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email: Value(email),
      phone: Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      roleId: Value(roleId),
      passwordHash: Value(passwordHash),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      roleId: serializer.fromJson<int>(json['roleId']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String?>(address),
      'roleId': serializer.toJson<int>(roleId),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          String? email,
          String? phone,
          Value<String?> address = const Value.absent(),
          int? roleId,
          String? passwordHash,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address.present ? address.value : this.address,
        roleId: roleId ?? this.roleId,
        passwordHash: passwordHash ?? this.passwordHash,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('roleId: $roleId, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName, email, phone,
      address, roleId, passwordHash, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.roleId == this.roleId &&
          other.passwordHash == this.passwordHash &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> phone;
  final Value<String?> address;
  final Value<int> roleId;
  final Value<String> passwordHash;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.roleId = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    this.address = const Value.absent(),
    required int roleId,
    required String passwordHash,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        email = Value(email),
        phone = Value(phone),
        roleId = Value(roleId),
        passwordHash = Value(passwordHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<int>? roleId,
    Expression<String>? passwordHash,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (roleId != null) 'role_id': roleId,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? email,
      Value<String>? phone,
      Value<String?>? address,
      Value<int>? roleId,
      Value<String>? passwordHash,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      roleId: roleId ?? this.roleId,
      passwordHash: passwordHash ?? this.passwordHash,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('roleId: $roleId, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Category(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Category copyWith(
          {int? id, String? name, DateTime? createdAt, DateTime? updatedAt}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES categories(id) NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      check: () => ComparableExpr(quantity).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      check: () => ComparableExpr(unitPrice).isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _isForSaleMeta =
      const VerificationMeta('isForSale');
  @override
  late final GeneratedColumn<bool> isForSale = GeneratedColumn<bool>(
      'is_for_sale', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_for_sale" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isLowQualityMeta =
      const VerificationMeta('isLowQuality');
  @override
  late final GeneratedColumn<bool> isLowQuality = GeneratedColumn<bool>(
      'is_low_quality', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_low_quality" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _addedByMeta =
      const VerificationMeta('addedBy');
  @override
  late final GeneratedColumn<int> addedBy = GeneratedColumn<int>(
      'added_by', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<InventoryType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<InventoryType>($InventoryItemsTable.$convertertype);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        categoryId,
        description,
        quantity,
        unitPrice,
        isForSale,
        isLowQuality,
        addedBy,
        type,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('is_for_sale')) {
      context.handle(
          _isForSaleMeta,
          isForSale.isAcceptableOrUnknown(
              data['is_for_sale']!, _isForSaleMeta));
    }
    if (data.containsKey('is_low_quality')) {
      context.handle(
          _isLowQualityMeta,
          isLowQuality.isAcceptableOrUnknown(
              data['is_low_quality']!, _isLowQualityMeta));
    }
    if (data.containsKey('added_by')) {
      context.handle(_addedByMeta,
          addedBy.isAcceptableOrUnknown(data['added_by']!, _addedByMeta));
    } else if (isInserting) {
      context.missing(_addedByMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      isForSale: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_for_sale'])!,
      isLowQuality: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_low_quality'])!,
      addedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}added_by'])!,
      type: $InventoryItemsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<InventoryType, String> $convertertype =
      const InventoryTypeConverter();
}

class InventoryItem extends DataClass implements Insertable<InventoryItem> {
  final int id;
  final String name;
  final int categoryId;
  final String? description;
  final int quantity;
  final double unitPrice;
  final bool isForSale;
  final bool isLowQuality;
  final int addedBy;
  final InventoryType type;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InventoryItem(
      {required this.id,
      required this.name,
      required this.categoryId,
      this.description,
      required this.quantity,
      required this.unitPrice,
      required this.isForSale,
      required this.isLowQuality,
      required this.addedBy,
      required this.type,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['is_for_sale'] = Variable<bool>(isForSale);
    map['is_low_quality'] = Variable<bool>(isLowQuality);
    map['added_by'] = Variable<int>(addedBy);
    {
      map['type'] =
          Variable<String>($InventoryItemsTable.$convertertype.toSql(type));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: Value(id),
      name: Value(name),
      categoryId: Value(categoryId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      isForSale: Value(isForSale),
      isLowQuality: Value(isLowQuality),
      addedBy: Value(addedBy),
      type: Value(type),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InventoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      description: serializer.fromJson<String?>(json['description']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      isForSale: serializer.fromJson<bool>(json['isForSale']),
      isLowQuality: serializer.fromJson<bool>(json['isLowQuality']),
      addedBy: serializer.fromJson<int>(json['addedBy']),
      type: serializer.fromJson<InventoryType>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<int>(categoryId),
      'description': serializer.toJson<String?>(description),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'isForSale': serializer.toJson<bool>(isForSale),
      'isLowQuality': serializer.toJson<bool>(isLowQuality),
      'addedBy': serializer.toJson<int>(addedBy),
      'type': serializer.toJson<InventoryType>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InventoryItem copyWith(
          {int? id,
          String? name,
          int? categoryId,
          Value<String?> description = const Value.absent(),
          int? quantity,
          double? unitPrice,
          bool? isForSale,
          bool? isLowQuality,
          int? addedBy,
          InventoryType? type,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      InventoryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        description: description.present ? description.value : this.description,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        isForSale: isForSale ?? this.isForSale,
        isLowQuality: isLowQuality ?? this.isLowQuality,
        addedBy: addedBy ?? this.addedBy,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  InventoryItem copyWithCompanion(InventoryItemsCompanion data) {
    return InventoryItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      description:
          data.description.present ? data.description.value : this.description,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      isForSale: data.isForSale.present ? data.isForSale.value : this.isForSale,
      isLowQuality: data.isLowQuality.present
          ? data.isLowQuality.value
          : this.isLowQuality,
      addedBy: data.addedBy.present ? data.addedBy.value : this.addedBy,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('isForSale: $isForSale, ')
          ..write('isLowQuality: $isLowQuality, ')
          ..write('addedBy: $addedBy, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, categoryId, description, quantity,
      unitPrice, isForSale, isLowQuality, addedBy, type, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.description == this.description &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.isForSale == this.isForSale &&
          other.isLowQuality == this.isLowQuality &&
          other.addedBy == this.addedBy &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> categoryId;
  final Value<String?> description;
  final Value<int> quantity;
  final Value<double> unitPrice;
  final Value<bool> isForSale;
  final Value<bool> isLowQuality;
  final Value<int> addedBy;
  final Value<InventoryType> type;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.isForSale = const Value.absent(),
    this.isLowQuality = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int categoryId,
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    required double unitPrice,
    this.isForSale = const Value.absent(),
    this.isLowQuality = const Value.absent(),
    required int addedBy,
    required InventoryType type,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        categoryId = Value(categoryId),
        unitPrice = Value(unitPrice),
        addedBy = Value(addedBy),
        type = Value(type);
  static Insertable<InventoryItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? categoryId,
    Expression<String>? description,
    Expression<int>? quantity,
    Expression<double>? unitPrice,
    Expression<bool>? isForSale,
    Expression<bool>? isLowQuality,
    Expression<int>? addedBy,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (description != null) 'description': description,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (isForSale != null) 'is_for_sale': isForSale,
      if (isLowQuality != null) 'is_low_quality': isLowQuality,
      if (addedBy != null) 'added_by': addedBy,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InventoryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? categoryId,
      Value<String?>? description,
      Value<int>? quantity,
      Value<double>? unitPrice,
      Value<bool>? isForSale,
      Value<bool>? isLowQuality,
      Value<int>? addedBy,
      Value<InventoryType>? type,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      isForSale: isForSale ?? this.isForSale,
      isLowQuality: isLowQuality ?? this.isLowQuality,
      addedBy: addedBy ?? this.addedBy,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (isForSale.present) {
      map['is_for_sale'] = Variable<bool>(isForSale.value);
    }
    if (isLowQuality.present) {
      map['is_low_quality'] = Variable<bool>(isLowQuality.value);
    }
    if (addedBy.present) {
      map['added_by'] = Variable<int>(addedBy.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $InventoryItemsTable.$convertertype.toSql(type.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('isForSale: $isForSale, ')
          ..write('isLowQuality: $isLowQuality, ')
          ..write('addedBy: $addedBy, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InventoryPriceHistoriesTable extends InventoryPriceHistories
    with TableInfo<$InventoryPriceHistoriesTable, InventoryPriceHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryPriceHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _inventoryIdMeta =
      const VerificationMeta('inventoryId');
  @override
  late final GeneratedColumn<int> inventoryId = GeneratedColumn<int>(
      'inventory_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES inventory_items(id) NOT NULL');
  static const VerificationMeta _oldPriceMeta =
      const VerificationMeta('oldPrice');
  @override
  late final GeneratedColumn<double> oldPrice = GeneratedColumn<double>(
      'old_price', aliasedName, false,
      check: () => ComparableExpr(oldPrice).isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _newPriceMeta =
      const VerificationMeta('newPrice');
  @override
  late final GeneratedColumn<double> newPrice = GeneratedColumn<double>(
      'new_price', aliasedName, false,
      check: () => ComparableExpr(newPrice).isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _changedByMeta =
      const VerificationMeta('changedBy');
  @override
  late final GeneratedColumn<int> changedBy = GeneratedColumn<int>(
      'changed_by', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  static const VerificationMeta _changedAtMeta =
      const VerificationMeta('changedAt');
  @override
  late final GeneratedColumn<DateTime> changedAt = GeneratedColumn<DateTime>(
      'changed_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        inventoryId,
        oldPrice,
        newPrice,
        changedBy,
        changedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_price_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryPriceHistory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inventory_id')) {
      context.handle(
          _inventoryIdMeta,
          inventoryId.isAcceptableOrUnknown(
              data['inventory_id']!, _inventoryIdMeta));
    } else if (isInserting) {
      context.missing(_inventoryIdMeta);
    }
    if (data.containsKey('old_price')) {
      context.handle(_oldPriceMeta,
          oldPrice.isAcceptableOrUnknown(data['old_price']!, _oldPriceMeta));
    } else if (isInserting) {
      context.missing(_oldPriceMeta);
    }
    if (data.containsKey('new_price')) {
      context.handle(_newPriceMeta,
          newPrice.isAcceptableOrUnknown(data['new_price']!, _newPriceMeta));
    } else if (isInserting) {
      context.missing(_newPriceMeta);
    }
    if (data.containsKey('changed_by')) {
      context.handle(_changedByMeta,
          changedBy.isAcceptableOrUnknown(data['changed_by']!, _changedByMeta));
    } else if (isInserting) {
      context.missing(_changedByMeta);
    }
    if (data.containsKey('changed_at')) {
      context.handle(_changedAtMeta,
          changedAt.isAcceptableOrUnknown(data['changed_at']!, _changedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryPriceHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryPriceHistory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      inventoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}inventory_id'])!,
      oldPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}old_price'])!,
      newPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}new_price'])!,
      changedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}changed_by'])!,
      changedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}changed_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $InventoryPriceHistoriesTable createAlias(String alias) {
    return $InventoryPriceHistoriesTable(attachedDatabase, alias);
  }
}

class InventoryPriceHistory extends DataClass
    implements Insertable<InventoryPriceHistory> {
  final int id;
  final int inventoryId;
  final double oldPrice;
  final double newPrice;
  final int changedBy;
  final DateTime changedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InventoryPriceHistory(
      {required this.id,
      required this.inventoryId,
      required this.oldPrice,
      required this.newPrice,
      required this.changedBy,
      required this.changedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inventory_id'] = Variable<int>(inventoryId);
    map['old_price'] = Variable<double>(oldPrice);
    map['new_price'] = Variable<double>(newPrice);
    map['changed_by'] = Variable<int>(changedBy);
    map['changed_at'] = Variable<DateTime>(changedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InventoryPriceHistoriesCompanion toCompanion(bool nullToAbsent) {
    return InventoryPriceHistoriesCompanion(
      id: Value(id),
      inventoryId: Value(inventoryId),
      oldPrice: Value(oldPrice),
      newPrice: Value(newPrice),
      changedBy: Value(changedBy),
      changedAt: Value(changedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InventoryPriceHistory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryPriceHistory(
      id: serializer.fromJson<int>(json['id']),
      inventoryId: serializer.fromJson<int>(json['inventoryId']),
      oldPrice: serializer.fromJson<double>(json['oldPrice']),
      newPrice: serializer.fromJson<double>(json['newPrice']),
      changedBy: serializer.fromJson<int>(json['changedBy']),
      changedAt: serializer.fromJson<DateTime>(json['changedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inventoryId': serializer.toJson<int>(inventoryId),
      'oldPrice': serializer.toJson<double>(oldPrice),
      'newPrice': serializer.toJson<double>(newPrice),
      'changedBy': serializer.toJson<int>(changedBy),
      'changedAt': serializer.toJson<DateTime>(changedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InventoryPriceHistory copyWith(
          {int? id,
          int? inventoryId,
          double? oldPrice,
          double? newPrice,
          int? changedBy,
          DateTime? changedAt,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      InventoryPriceHistory(
        id: id ?? this.id,
        inventoryId: inventoryId ?? this.inventoryId,
        oldPrice: oldPrice ?? this.oldPrice,
        newPrice: newPrice ?? this.newPrice,
        changedBy: changedBy ?? this.changedBy,
        changedAt: changedAt ?? this.changedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  InventoryPriceHistory copyWithCompanion(
      InventoryPriceHistoriesCompanion data) {
    return InventoryPriceHistory(
      id: data.id.present ? data.id.value : this.id,
      inventoryId:
          data.inventoryId.present ? data.inventoryId.value : this.inventoryId,
      oldPrice: data.oldPrice.present ? data.oldPrice.value : this.oldPrice,
      newPrice: data.newPrice.present ? data.newPrice.value : this.newPrice,
      changedBy: data.changedBy.present ? data.changedBy.value : this.changedBy,
      changedAt: data.changedAt.present ? data.changedAt.value : this.changedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryPriceHistory(')
          ..write('id: $id, ')
          ..write('inventoryId: $inventoryId, ')
          ..write('oldPrice: $oldPrice, ')
          ..write('newPrice: $newPrice, ')
          ..write('changedBy: $changedBy, ')
          ..write('changedAt: $changedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, inventoryId, oldPrice, newPrice,
      changedBy, changedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryPriceHistory &&
          other.id == this.id &&
          other.inventoryId == this.inventoryId &&
          other.oldPrice == this.oldPrice &&
          other.newPrice == this.newPrice &&
          other.changedBy == this.changedBy &&
          other.changedAt == this.changedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InventoryPriceHistoriesCompanion
    extends UpdateCompanion<InventoryPriceHistory> {
  final Value<int> id;
  final Value<int> inventoryId;
  final Value<double> oldPrice;
  final Value<double> newPrice;
  final Value<int> changedBy;
  final Value<DateTime> changedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InventoryPriceHistoriesCompanion({
    this.id = const Value.absent(),
    this.inventoryId = const Value.absent(),
    this.oldPrice = const Value.absent(),
    this.newPrice = const Value.absent(),
    this.changedBy = const Value.absent(),
    this.changedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InventoryPriceHistoriesCompanion.insert({
    this.id = const Value.absent(),
    required int inventoryId,
    required double oldPrice,
    required double newPrice,
    required int changedBy,
    this.changedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : inventoryId = Value(inventoryId),
        oldPrice = Value(oldPrice),
        newPrice = Value(newPrice),
        changedBy = Value(changedBy);
  static Insertable<InventoryPriceHistory> custom({
    Expression<int>? id,
    Expression<int>? inventoryId,
    Expression<double>? oldPrice,
    Expression<double>? newPrice,
    Expression<int>? changedBy,
    Expression<DateTime>? changedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inventoryId != null) 'inventory_id': inventoryId,
      if (oldPrice != null) 'old_price': oldPrice,
      if (newPrice != null) 'new_price': newPrice,
      if (changedBy != null) 'changed_by': changedBy,
      if (changedAt != null) 'changed_at': changedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InventoryPriceHistoriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? inventoryId,
      Value<double>? oldPrice,
      Value<double>? newPrice,
      Value<int>? changedBy,
      Value<DateTime>? changedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return InventoryPriceHistoriesCompanion(
      id: id ?? this.id,
      inventoryId: inventoryId ?? this.inventoryId,
      oldPrice: oldPrice ?? this.oldPrice,
      newPrice: newPrice ?? this.newPrice,
      changedBy: changedBy ?? this.changedBy,
      changedAt: changedAt ?? this.changedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inventoryId.present) {
      map['inventory_id'] = Variable<int>(inventoryId.value);
    }
    if (oldPrice.present) {
      map['old_price'] = Variable<double>(oldPrice.value);
    }
    if (newPrice.present) {
      map['new_price'] = Variable<double>(newPrice.value);
    }
    if (changedBy.present) {
      map['changed_by'] = Variable<int>(changedBy.value);
    }
    if (changedAt.present) {
      map['changed_at'] = Variable<DateTime>(changedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryPriceHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('inventoryId: $inventoryId, ')
          ..write('oldPrice: $oldPrice, ')
          ..write('newPrice: $newPrice, ')
          ..write('changedBy: $changedBy, ')
          ..write('changedAt: $changedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _invoiceNumberMeta =
      const VerificationMeta('invoiceNumber');
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
      'invoice_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _inventoryIdMeta =
      const VerificationMeta('inventoryId');
  @override
  late final GeneratedColumn<int> inventoryId = GeneratedColumn<int>(
      'inventory_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES inventory_items(id) NOT NULL');
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      check: () => ComparableExpr(quantity).isBiggerThanValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      check: () => ComparableExpr(unitPrice).isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _unitPriceHistoryIdMeta =
      const VerificationMeta('unitPriceHistoryId');
  @override
  late final GeneratedColumn<int> unitPriceHistoryId = GeneratedColumn<int>(
      'unit_price_history_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES inventory_price_histories(id) NOT NULL');
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      check: () => ComparableExpr(totalPrice).isBiggerOrEqualValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _buyerIdMeta =
      const VerificationMeta('buyerId');
  @override
  late final GeneratedColumn<int> buyerId = GeneratedColumn<int>(
      'buyer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  static const VerificationMeta _sellerIdMeta =
      const VerificationMeta('sellerId');
  @override
  late final GeneratedColumn<int> sellerId = GeneratedColumn<int>(
      'seller_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumnWithTypeConverter<PaymentMethod, String>
      paymentMethod = GeneratedColumn<String>(
              'payment_method', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PaymentMethod>(
              $TransactionsTable.$converterpaymentMethod);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        invoiceNumber,
        inventoryId,
        quantity,
        unitPrice,
        unitPriceHistoryId,
        totalPrice,
        buyerId,
        sellerId,
        paymentMethod,
        description,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
          _invoiceNumberMeta,
          invoiceNumber.isAcceptableOrUnknown(
              data['invoice_number']!, _invoiceNumberMeta));
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('inventory_id')) {
      context.handle(
          _inventoryIdMeta,
          inventoryId.isAcceptableOrUnknown(
              data['inventory_id']!, _inventoryIdMeta));
    } else if (isInserting) {
      context.missing(_inventoryIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('unit_price_history_id')) {
      context.handle(
          _unitPriceHistoryIdMeta,
          unitPriceHistoryId.isAcceptableOrUnknown(
              data['unit_price_history_id']!, _unitPriceHistoryIdMeta));
    } else if (isInserting) {
      context.missing(_unitPriceHistoryIdMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('buyer_id')) {
      context.handle(_buyerIdMeta,
          buyerId.isAcceptableOrUnknown(data['buyer_id']!, _buyerIdMeta));
    } else if (isInserting) {
      context.missing(_buyerIdMeta);
    }
    if (data.containsKey('seller_id')) {
      context.handle(_sellerIdMeta,
          sellerId.isAcceptableOrUnknown(data['seller_id']!, _sellerIdMeta));
    } else if (isInserting) {
      context.missing(_sellerIdMeta);
    }
    context.handle(_paymentMethodMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      invoiceNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_number'])!,
      inventoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}inventory_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      unitPriceHistoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}unit_price_history_id'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      buyerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}buyer_id'])!,
      sellerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seller_id'])!,
      paymentMethod: $TransactionsTable.$converterpaymentMethod.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}payment_method'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static TypeConverter<PaymentMethod, String> $converterpaymentMethod =
      const PaymentMethodConverter();
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String invoiceNumber;
  final int inventoryId;
  final int quantity;
  final double unitPrice;
  final int unitPriceHistoryId;
  final double totalPrice;
  final int buyerId;
  final int sellerId;
  final PaymentMethod paymentMethod;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Transaction(
      {required this.id,
      required this.invoiceNumber,
      required this.inventoryId,
      required this.quantity,
      required this.unitPrice,
      required this.unitPriceHistoryId,
      required this.totalPrice,
      required this.buyerId,
      required this.sellerId,
      required this.paymentMethod,
      this.description,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['inventory_id'] = Variable<int>(inventoryId);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['unit_price_history_id'] = Variable<int>(unitPriceHistoryId);
    map['total_price'] = Variable<double>(totalPrice);
    map['buyer_id'] = Variable<int>(buyerId);
    map['seller_id'] = Variable<int>(sellerId);
    {
      map['payment_method'] = Variable<String>(
          $TransactionsTable.$converterpaymentMethod.toSql(paymentMethod));
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      invoiceNumber: Value(invoiceNumber),
      inventoryId: Value(inventoryId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      unitPriceHistoryId: Value(unitPriceHistoryId),
      totalPrice: Value(totalPrice),
      buyerId: Value(buyerId),
      sellerId: Value(sellerId),
      paymentMethod: Value(paymentMethod),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      inventoryId: serializer.fromJson<int>(json['inventoryId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      unitPriceHistoryId: serializer.fromJson<int>(json['unitPriceHistoryId']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      buyerId: serializer.fromJson<int>(json['buyerId']),
      sellerId: serializer.fromJson<int>(json['sellerId']),
      paymentMethod: serializer.fromJson<PaymentMethod>(json['paymentMethod']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'inventoryId': serializer.toJson<int>(inventoryId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'unitPriceHistoryId': serializer.toJson<int>(unitPriceHistoryId),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'buyerId': serializer.toJson<int>(buyerId),
      'sellerId': serializer.toJson<int>(sellerId),
      'paymentMethod': serializer.toJson<PaymentMethod>(paymentMethod),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Transaction copyWith(
          {int? id,
          String? invoiceNumber,
          int? inventoryId,
          int? quantity,
          double? unitPrice,
          int? unitPriceHistoryId,
          double? totalPrice,
          int? buyerId,
          int? sellerId,
          PaymentMethod? paymentMethod,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Transaction(
        id: id ?? this.id,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        inventoryId: inventoryId ?? this.inventoryId,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        unitPriceHistoryId: unitPriceHistoryId ?? this.unitPriceHistoryId,
        totalPrice: totalPrice ?? this.totalPrice,
        buyerId: buyerId ?? this.buyerId,
        sellerId: sellerId ?? this.sellerId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      inventoryId:
          data.inventoryId.present ? data.inventoryId.value : this.inventoryId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      unitPriceHistoryId: data.unitPriceHistoryId.present
          ? data.unitPriceHistoryId.value
          : this.unitPriceHistoryId,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      buyerId: data.buyerId.present ? data.buyerId.value : this.buyerId,
      sellerId: data.sellerId.present ? data.sellerId.value : this.sellerId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('inventoryId: $inventoryId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitPriceHistoryId: $unitPriceHistoryId, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('buyerId: $buyerId, ')
          ..write('sellerId: $sellerId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      invoiceNumber,
      inventoryId,
      quantity,
      unitPrice,
      unitPriceHistoryId,
      totalPrice,
      buyerId,
      sellerId,
      paymentMethod,
      description,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.invoiceNumber == this.invoiceNumber &&
          other.inventoryId == this.inventoryId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.unitPriceHistoryId == this.unitPriceHistoryId &&
          other.totalPrice == this.totalPrice &&
          other.buyerId == this.buyerId &&
          other.sellerId == this.sellerId &&
          other.paymentMethod == this.paymentMethod &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> invoiceNumber;
  final Value<int> inventoryId;
  final Value<int> quantity;
  final Value<double> unitPrice;
  final Value<int> unitPriceHistoryId;
  final Value<double> totalPrice;
  final Value<int> buyerId;
  final Value<int> sellerId;
  final Value<PaymentMethod> paymentMethod;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.inventoryId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unitPriceHistoryId = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.buyerId = const Value.absent(),
    this.sellerId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceNumber,
    required int inventoryId,
    required int quantity,
    required double unitPrice,
    required int unitPriceHistoryId,
    required double totalPrice,
    required int buyerId,
    required int sellerId,
    required PaymentMethod paymentMethod,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : invoiceNumber = Value(invoiceNumber),
        inventoryId = Value(inventoryId),
        quantity = Value(quantity),
        unitPrice = Value(unitPrice),
        unitPriceHistoryId = Value(unitPriceHistoryId),
        totalPrice = Value(totalPrice),
        buyerId = Value(buyerId),
        sellerId = Value(sellerId),
        paymentMethod = Value(paymentMethod);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? invoiceNumber,
    Expression<int>? inventoryId,
    Expression<int>? quantity,
    Expression<double>? unitPrice,
    Expression<int>? unitPriceHistoryId,
    Expression<double>? totalPrice,
    Expression<int>? buyerId,
    Expression<int>? sellerId,
    Expression<String>? paymentMethod,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (inventoryId != null) 'inventory_id': inventoryId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (unitPriceHistoryId != null)
        'unit_price_history_id': unitPriceHistoryId,
      if (totalPrice != null) 'total_price': totalPrice,
      if (buyerId != null) 'buyer_id': buyerId,
      if (sellerId != null) 'seller_id': sellerId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? invoiceNumber,
      Value<int>? inventoryId,
      Value<int>? quantity,
      Value<double>? unitPrice,
      Value<int>? unitPriceHistoryId,
      Value<double>? totalPrice,
      Value<int>? buyerId,
      Value<int>? sellerId,
      Value<PaymentMethod>? paymentMethod,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      inventoryId: inventoryId ?? this.inventoryId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      unitPriceHistoryId: unitPriceHistoryId ?? this.unitPriceHistoryId,
      totalPrice: totalPrice ?? this.totalPrice,
      buyerId: buyerId ?? this.buyerId,
      sellerId: sellerId ?? this.sellerId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (inventoryId.present) {
      map['inventory_id'] = Variable<int>(inventoryId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (unitPriceHistoryId.present) {
      map['unit_price_history_id'] = Variable<int>(unitPriceHistoryId.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (buyerId.present) {
      map['buyer_id'] = Variable<int>(buyerId.value);
    }
    if (sellerId.present) {
      map['seller_id'] = Variable<int>(sellerId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>($TransactionsTable
          .$converterpaymentMethod
          .toSql(paymentMethod.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('inventoryId: $inventoryId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitPriceHistoryId: $unitPriceHistoryId, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('buyerId: $buyerId, ')
          ..write('sellerId: $sellerId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RolesTable roles = $RolesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $InventoryItemsTable inventoryItems = $InventoryItemsTable(this);
  late final $InventoryPriceHistoriesTable inventoryPriceHistories =
      $InventoryPriceHistoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        roles,
        users,
        categories,
        inventoryItems,
        inventoryPriceHistories,
        transactions
      ];
}

typedef $$RolesTableCreateCompanionBuilder = RolesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$RolesTableUpdateCompanionBuilder = RolesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$RolesTableReferences
    extends BaseReferences<_$AppDatabase, $RolesTable, Role> {
  $$RolesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<User>> _usersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.users,
          aliasName: $_aliasNameGenerator(db.roles.id, db.users.roleId));

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.roleId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RolesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RolesTable> {
  $$RolesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter usersRefs(
      ComposableFilter Function($$UsersTableFilterComposer f) f) {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.roleId,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$RolesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RolesTable> {
  $$RolesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$RolesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RolesTable,
    Role,
    $$RolesTableFilterComposer,
    $$RolesTableOrderingComposer,
    $$RolesTableCreateCompanionBuilder,
    $$RolesTableUpdateCompanionBuilder,
    (Role, $$RolesTableReferences),
    Role,
    PrefetchHooks Function({bool usersRefs})> {
  $$RolesTableTableManager(_$AppDatabase db, $RolesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RolesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RolesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RolesCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RolesCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RolesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({usersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usersRefs) db.users],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RolesTableReferences._usersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RolesTableReferences(db, table, p0).usersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RolesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RolesTable,
    Role,
    $$RolesTableFilterComposer,
    $$RolesTableOrderingComposer,
    $$RolesTableCreateCompanionBuilder,
    $$RolesTableUpdateCompanionBuilder,
    (Role, $$RolesTableReferences),
    Role,
    PrefetchHooks Function({bool usersRefs})>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String firstName,
  required String lastName,
  required String email,
  required String phone,
  Value<String?> address,
  required int roleId,
  required String passwordHash,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> email,
  Value<String> phone,
  Value<String?> address,
  Value<int> roleId,
  Value<String> passwordHash,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RolesTable _roleIdTable(_$AppDatabase db) =>
      db.roles.createAlias($_aliasNameGenerator(db.users.roleId, db.roles.id));

  $$RolesTableProcessedTableManager? get roleId {
    if ($_item.roleId == null) return null;
    final manager = $$RolesTableTableManager($_db, $_db.roles)
        .filter((f) => f.id($_item.roleId!));
    final item = $_typedResult.readTableOrNull(_roleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$InventoryItemsTable, List<InventoryItem>>
      _inventoryItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.inventoryItems,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.inventoryItems.addedBy));

  $$InventoryItemsTableProcessedTableManager get inventoryItemsRefs {
    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.addedBy.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_inventoryItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InventoryPriceHistoriesTable,
      List<InventoryPriceHistory>> _inventoryPriceHistoriesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryPriceHistories,
          aliasName: $_aliasNameGenerator(
              db.users.id, db.inventoryPriceHistories.changedBy));

  $$InventoryPriceHistoriesTableProcessedTableManager
      get inventoryPriceHistoriesRefs {
    final manager = $$InventoryPriceHistoriesTableTableManager(
            $_db, $_db.inventoryPriceHistories)
        .filter((f) => f.changedBy.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_inventoryPriceHistoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _buyerIdTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.transactions.buyerId));

  $$TransactionsTableProcessedTableManager get buyerId {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.buyerId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_buyerIdTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _sellerIdTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.transactions.sellerId));

  $$TransactionsTableProcessedTableManager get sellerId {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.sellerId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_sellerIdTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get passwordHash => $state.composableBuilder(
      column: $state.table.passwordHash,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$RolesTableFilterComposer get roleId {
    final $$RolesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $state.db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RolesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.roles, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter inventoryItemsRefs(
      ComposableFilter Function($$InventoryItemsTableFilterComposer f) f) {
    final $$InventoryItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.inventoryItems,
        getReferencedColumn: (t) => t.addedBy,
        builder: (joinBuilder, parentComposers) =>
            $$InventoryItemsTableFilterComposer(ComposerState($state.db,
                $state.db.inventoryItems, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter inventoryPriceHistoriesRefs(
      ComposableFilter Function($$InventoryPriceHistoriesTableFilterComposer f)
          f) {
    final $$InventoryPriceHistoriesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.inventoryPriceHistories,
            getReferencedColumn: (t) => t.changedBy,
            builder: (joinBuilder, parentComposers) =>
                $$InventoryPriceHistoriesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.inventoryPriceHistories,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter buyerId(
      ComposableFilter Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.buyerId,
        builder: (joinBuilder, parentComposers) =>
            $$TransactionsTableFilterComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter sellerId(
      ComposableFilter Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.sellerId,
        builder: (joinBuilder, parentComposers) =>
            $$TransactionsTableFilterComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get passwordHash => $state.composableBuilder(
      column: $state.table.passwordHash,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$RolesTableOrderingComposer get roleId {
    final $$RolesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $state.db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RolesTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.roles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function(
        {bool roleId,
        bool inventoryItemsRefs,
        bool inventoryPriceHistoriesRefs,
        bool buyerId,
        bool sellerId})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<int> roleId = const Value.absent(),
            Value<String> passwordHash = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            address: address,
            roleId: roleId,
            passwordHash: passwordHash,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required String lastName,
            required String email,
            required String phone,
            Value<String?> address = const Value.absent(),
            required int roleId,
            required String passwordHash,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            address: address,
            roleId: roleId,
            passwordHash: passwordHash,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {roleId = false,
              inventoryItemsRefs = false,
              inventoryPriceHistoriesRefs = false,
              buyerId = false,
              sellerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryItemsRefs) db.inventoryItems,
                if (inventoryPriceHistoriesRefs) db.inventoryPriceHistories,
                if (buyerId) db.transactions,
                if (sellerId) db.transactions
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (roleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roleId,
                    referencedTable: $$UsersTableReferences._roleIdTable(db),
                    referencedColumn:
                        $$UsersTableReferences._roleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._inventoryItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .inventoryItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.addedBy == item.id),
                        typedResults: items),
                  if (inventoryPriceHistoriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$UsersTableReferences
                            ._inventoryPriceHistoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .inventoryPriceHistoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.changedBy == item.id),
                        typedResults: items),
                  if (buyerId)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._buyerIdTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).buyerId,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.buyerId == item.id),
                        typedResults: items),
                  if (sellerId)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._sellerIdTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).sellerId,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.sellerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function(
        {bool roleId,
        bool inventoryItemsRefs,
        bool inventoryPriceHistoriesRefs,
        bool buyerId,
        bool sellerId})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InventoryItemsTable, List<InventoryItem>>
      _inventoryItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.inventoryItems,
              aliasName: $_aliasNameGenerator(
                  db.categories.id, db.inventoryItems.categoryId));

  $$InventoryItemsTableProcessedTableManager get inventoryItemsRefs {
    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_inventoryItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter inventoryItemsRefs(
      ComposableFilter Function($$InventoryItemsTableFilterComposer f) f) {
    final $$InventoryItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.inventoryItems,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) =>
            $$InventoryItemsTableFilterComposer(ComposerState($state.db,
                $state.db.inventoryItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool inventoryItemsRefs})> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({inventoryItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryItemsRefs) db.inventoryItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._inventoryItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .inventoryItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool inventoryItemsRefs})>;
typedef $$InventoryItemsTableCreateCompanionBuilder = InventoryItemsCompanion
    Function({
  Value<int> id,
  required String name,
  required int categoryId,
  Value<String?> description,
  Value<int> quantity,
  required double unitPrice,
  Value<bool> isForSale,
  Value<bool> isLowQuality,
  required int addedBy,
  required InventoryType type,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$InventoryItemsTableUpdateCompanionBuilder = InventoryItemsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> categoryId,
  Value<String?> description,
  Value<int> quantity,
  Value<double> unitPrice,
  Value<bool> isForSale,
  Value<bool> isLowQuality,
  Value<int> addedBy,
  Value<InventoryType> type,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$InventoryItemsTableReferences
    extends BaseReferences<_$AppDatabase, $InventoryItemsTable, InventoryItem> {
  $$InventoryItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
          $_aliasNameGenerator(db.inventoryItems.categoryId, db.categories.id));

  $$CategoriesTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _addedByTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.inventoryItems.addedBy, db.users.id));

  $$UsersTableProcessedTableManager? get addedBy {
    if ($_item.addedBy == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.addedBy!));
    final item = $_typedResult.readTableOrNull(_addedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$InventoryPriceHistoriesTable,
      List<InventoryPriceHistory>> _inventoryPriceHistoriesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryPriceHistories,
          aliasName: $_aliasNameGenerator(
              db.inventoryItems.id, db.inventoryPriceHistories.inventoryId));

  $$InventoryPriceHistoriesTableProcessedTableManager
      get inventoryPriceHistoriesRefs {
    final manager = $$InventoryPriceHistoriesTableTableManager(
            $_db, $_db.inventoryPriceHistories)
        .filter((f) => f.inventoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_inventoryPriceHistoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName: $_aliasNameGenerator(
                  db.inventoryItems.id, db.transactions.inventoryId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.inventoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$InventoryItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get unitPrice => $state.composableBuilder(
      column: $state.table.unitPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isForSale => $state.composableBuilder(
      column: $state.table.isForSale,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isLowQuality => $state.composableBuilder(
      column: $state.table.isLowQuality,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<InventoryType, InventoryType, String>
      get type => $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get addedBy {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.addedBy,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter inventoryPriceHistoriesRefs(
      ComposableFilter Function($$InventoryPriceHistoriesTableFilterComposer f)
          f) {
    final $$InventoryPriceHistoriesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.inventoryPriceHistories,
            getReferencedColumn: (t) => t.inventoryId,
            builder: (joinBuilder, parentComposers) =>
                $$InventoryPriceHistoriesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.inventoryPriceHistories,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter transactionsRefs(
      ComposableFilter Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.inventoryId,
        builder: (joinBuilder, parentComposers) =>
            $$TransactionsTableFilterComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$InventoryItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get unitPrice => $state.composableBuilder(
      column: $state.table.unitPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isForSale => $state.composableBuilder(
      column: $state.table.isForSale,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isLowQuality => $state.composableBuilder(
      column: $state.table.isLowQuality,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableOrderingComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get addedBy {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.addedBy,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$InventoryItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryItemsTable,
    InventoryItem,
    $$InventoryItemsTableFilterComposer,
    $$InventoryItemsTableOrderingComposer,
    $$InventoryItemsTableCreateCompanionBuilder,
    $$InventoryItemsTableUpdateCompanionBuilder,
    (InventoryItem, $$InventoryItemsTableReferences),
    InventoryItem,
    PrefetchHooks Function(
        {bool categoryId,
        bool addedBy,
        bool inventoryPriceHistoriesRefs,
        bool transactionsRefs})> {
  $$InventoryItemsTableTableManager(
      _$AppDatabase db, $InventoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$InventoryItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$InventoryItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<bool> isForSale = const Value.absent(),
            Value<bool> isLowQuality = const Value.absent(),
            Value<int> addedBy = const Value.absent(),
            Value<InventoryType> type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              InventoryItemsCompanion(
            id: id,
            name: name,
            categoryId: categoryId,
            description: description,
            quantity: quantity,
            unitPrice: unitPrice,
            isForSale: isForSale,
            isLowQuality: isLowQuality,
            addedBy: addedBy,
            type: type,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int categoryId,
            Value<String?> description = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            required double unitPrice,
            Value<bool> isForSale = const Value.absent(),
            Value<bool> isLowQuality = const Value.absent(),
            required int addedBy,
            required InventoryType type,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              InventoryItemsCompanion.insert(
            id: id,
            name: name,
            categoryId: categoryId,
            description: description,
            quantity: quantity,
            unitPrice: unitPrice,
            isForSale: isForSale,
            isLowQuality: isLowQuality,
            addedBy: addedBy,
            type: type,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false,
              addedBy = false,
              inventoryPriceHistoriesRefs = false,
              transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryPriceHistoriesRefs) db.inventoryPriceHistories,
                if (transactionsRefs) db.transactions
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$InventoryItemsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$InventoryItemsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (addedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.addedBy,
                    referencedTable:
                        $$InventoryItemsTableReferences._addedByTable(db),
                    referencedColumn:
                        $$InventoryItemsTableReferences._addedByTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryPriceHistoriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$InventoryItemsTableReferences
                            ._inventoryPriceHistoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InventoryItemsTableReferences(db, table, p0)
                                .inventoryPriceHistoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.inventoryId == item.id),
                        typedResults: items),
                  if (transactionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$InventoryItemsTableReferences
                            ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InventoryItemsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.inventoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$InventoryItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InventoryItemsTable,
    InventoryItem,
    $$InventoryItemsTableFilterComposer,
    $$InventoryItemsTableOrderingComposer,
    $$InventoryItemsTableCreateCompanionBuilder,
    $$InventoryItemsTableUpdateCompanionBuilder,
    (InventoryItem, $$InventoryItemsTableReferences),
    InventoryItem,
    PrefetchHooks Function(
        {bool categoryId,
        bool addedBy,
        bool inventoryPriceHistoriesRefs,
        bool transactionsRefs})>;
typedef $$InventoryPriceHistoriesTableCreateCompanionBuilder
    = InventoryPriceHistoriesCompanion Function({
  Value<int> id,
  required int inventoryId,
  required double oldPrice,
  required double newPrice,
  required int changedBy,
  Value<DateTime> changedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$InventoryPriceHistoriesTableUpdateCompanionBuilder
    = InventoryPriceHistoriesCompanion Function({
  Value<int> id,
  Value<int> inventoryId,
  Value<double> oldPrice,
  Value<double> newPrice,
  Value<int> changedBy,
  Value<DateTime> changedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$InventoryPriceHistoriesTableReferences extends BaseReferences<
    _$AppDatabase, $InventoryPriceHistoriesTable, InventoryPriceHistory> {
  $$InventoryPriceHistoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $InventoryItemsTable _inventoryIdTable(_$AppDatabase db) =>
      db.inventoryItems.createAlias($_aliasNameGenerator(
          db.inventoryPriceHistories.inventoryId, db.inventoryItems.id));

  $$InventoryItemsTableProcessedTableManager? get inventoryId {
    if ($_item.inventoryId == null) return null;
    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.id($_item.inventoryId!));
    final item = $_typedResult.readTableOrNull(_inventoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _changedByTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.inventoryPriceHistories.changedBy, db.users.id));

  $$UsersTableProcessedTableManager? get changedBy {
    if ($_item.changedBy == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.changedBy!));
    final item = $_typedResult.readTableOrNull(_changedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactions,
              aliasName: $_aliasNameGenerator(db.inventoryPriceHistories.id,
                  db.transactions.unitPriceHistoryId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.unitPriceHistoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$InventoryPriceHistoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $InventoryPriceHistoriesTable> {
  $$InventoryPriceHistoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get oldPrice => $state.composableBuilder(
      column: $state.table.oldPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get newPrice => $state.composableBuilder(
      column: $state.table.newPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get changedAt => $state.composableBuilder(
      column: $state.table.changedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$InventoryItemsTableFilterComposer get inventoryId {
    final $$InventoryItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.inventoryId,
        referencedTable: $state.db.inventoryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$InventoryItemsTableFilterComposer(ComposerState($state.db,
                $state.db.inventoryItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get changedBy {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.changedBy,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter transactionsRefs(
      ComposableFilter Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.unitPriceHistoryId,
        builder: (joinBuilder, parentComposers) =>
            $$TransactionsTableFilterComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$InventoryPriceHistoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $InventoryPriceHistoriesTable> {
  $$InventoryPriceHistoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get oldPrice => $state.composableBuilder(
      column: $state.table.oldPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get newPrice => $state.composableBuilder(
      column: $state.table.newPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get changedAt => $state.composableBuilder(
      column: $state.table.changedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$InventoryItemsTableOrderingComposer get inventoryId {
    final $$InventoryItemsTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.inventoryId,
            referencedTable: $state.db.inventoryItems,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$InventoryItemsTableOrderingComposer(ComposerState($state.db,
                    $state.db.inventoryItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get changedBy {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.changedBy,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$InventoryPriceHistoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryPriceHistoriesTable,
    InventoryPriceHistory,
    $$InventoryPriceHistoriesTableFilterComposer,
    $$InventoryPriceHistoriesTableOrderingComposer,
    $$InventoryPriceHistoriesTableCreateCompanionBuilder,
    $$InventoryPriceHistoriesTableUpdateCompanionBuilder,
    (InventoryPriceHistory, $$InventoryPriceHistoriesTableReferences),
    InventoryPriceHistory,
    PrefetchHooks Function(
        {bool inventoryId, bool changedBy, bool transactionsRefs})> {
  $$InventoryPriceHistoriesTableTableManager(
      _$AppDatabase db, $InventoryPriceHistoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$InventoryPriceHistoriesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$InventoryPriceHistoriesTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> inventoryId = const Value.absent(),
            Value<double> oldPrice = const Value.absent(),
            Value<double> newPrice = const Value.absent(),
            Value<int> changedBy = const Value.absent(),
            Value<DateTime> changedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              InventoryPriceHistoriesCompanion(
            id: id,
            inventoryId: inventoryId,
            oldPrice: oldPrice,
            newPrice: newPrice,
            changedBy: changedBy,
            changedAt: changedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int inventoryId,
            required double oldPrice,
            required double newPrice,
            required int changedBy,
            Value<DateTime> changedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              InventoryPriceHistoriesCompanion.insert(
            id: id,
            inventoryId: inventoryId,
            oldPrice: oldPrice,
            newPrice: newPrice,
            changedBy: changedBy,
            changedAt: changedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryPriceHistoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {inventoryId = false,
              changedBy = false,
              transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (inventoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.inventoryId,
                    referencedTable: $$InventoryPriceHistoriesTableReferences
                        ._inventoryIdTable(db),
                    referencedColumn: $$InventoryPriceHistoriesTableReferences
                        ._inventoryIdTable(db)
                        .id,
                  ) as T;
                }
                if (changedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.changedBy,
                    referencedTable: $$InventoryPriceHistoriesTableReferences
                        ._changedByTable(db),
                    referencedColumn: $$InventoryPriceHistoriesTableReferences
                        ._changedByTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$InventoryPriceHistoriesTableReferences
                                ._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InventoryPriceHistoriesTableReferences(
                                    db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.unitPriceHistoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$InventoryPriceHistoriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $InventoryPriceHistoriesTable,
        InventoryPriceHistory,
        $$InventoryPriceHistoriesTableFilterComposer,
        $$InventoryPriceHistoriesTableOrderingComposer,
        $$InventoryPriceHistoriesTableCreateCompanionBuilder,
        $$InventoryPriceHistoriesTableUpdateCompanionBuilder,
        (InventoryPriceHistory, $$InventoryPriceHistoriesTableReferences),
        InventoryPriceHistory,
        PrefetchHooks Function(
            {bool inventoryId, bool changedBy, bool transactionsRefs})>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required String invoiceNumber,
  required int inventoryId,
  required int quantity,
  required double unitPrice,
  required int unitPriceHistoryId,
  required double totalPrice,
  required int buyerId,
  required int sellerId,
  required PaymentMethod paymentMethod,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String> invoiceNumber,
  Value<int> inventoryId,
  Value<int> quantity,
  Value<double> unitPrice,
  Value<int> unitPriceHistoryId,
  Value<double> totalPrice,
  Value<int> buyerId,
  Value<int> sellerId,
  Value<PaymentMethod> paymentMethod,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InventoryItemsTable _inventoryIdTable(_$AppDatabase db) =>
      db.inventoryItems.createAlias($_aliasNameGenerator(
          db.transactions.inventoryId, db.inventoryItems.id));

  $$InventoryItemsTableProcessedTableManager? get inventoryId {
    if ($_item.inventoryId == null) return null;
    final manager = $$InventoryItemsTableTableManager($_db, $_db.inventoryItems)
        .filter((f) => f.id($_item.inventoryId!));
    final item = $_typedResult.readTableOrNull(_inventoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $InventoryPriceHistoriesTable _unitPriceHistoryIdTable(
          _$AppDatabase db) =>
      db.inventoryPriceHistories.createAlias($_aliasNameGenerator(
          db.transactions.unitPriceHistoryId, db.inventoryPriceHistories.id));

  $$InventoryPriceHistoriesTableProcessedTableManager? get unitPriceHistoryId {
    if ($_item.unitPriceHistoryId == null) return null;
    final manager = $$InventoryPriceHistoriesTableTableManager(
            $_db, $_db.inventoryPriceHistories)
        .filter((f) => f.id($_item.unitPriceHistoryId!));
    final item = $_typedResult.readTableOrNull(_unitPriceHistoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _buyerIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.transactions.buyerId, db.users.id));

  $$UsersTableProcessedTableManager? get buyerId {
    if ($_item.buyerId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.buyerId!));
    final item = $_typedResult.readTableOrNull(_buyerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _sellerIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.transactions.sellerId, db.users.id));

  $$UsersTableProcessedTableManager? get sellerId {
    if ($_item.sellerId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.sellerId!));
    final item = $_typedResult.readTableOrNull(_sellerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get invoiceNumber => $state.composableBuilder(
      column: $state.table.invoiceNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get unitPrice => $state.composableBuilder(
      column: $state.table.unitPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalPrice => $state.composableBuilder(
      column: $state.table.totalPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<PaymentMethod, PaymentMethod, String>
      get paymentMethod => $state.composableBuilder(
          column: $state.table.paymentMethod,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$InventoryItemsTableFilterComposer get inventoryId {
    final $$InventoryItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.inventoryId,
        referencedTable: $state.db.inventoryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$InventoryItemsTableFilterComposer(ComposerState($state.db,
                $state.db.inventoryItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$InventoryPriceHistoriesTableFilterComposer get unitPriceHistoryId {
    final $$InventoryPriceHistoriesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.unitPriceHistoryId,
            referencedTable: $state.db.inventoryPriceHistories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$InventoryPriceHistoriesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.inventoryPriceHistories,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get buyerId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get sellerId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sellerId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get invoiceNumber => $state.composableBuilder(
      column: $state.table.invoiceNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get unitPrice => $state.composableBuilder(
      column: $state.table.unitPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalPrice => $state.composableBuilder(
      column: $state.table.totalPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get paymentMethod => $state.composableBuilder(
      column: $state.table.paymentMethod,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$InventoryItemsTableOrderingComposer get inventoryId {
    final $$InventoryItemsTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.inventoryId,
            referencedTable: $state.db.inventoryItems,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$InventoryItemsTableOrderingComposer(ComposerState($state.db,
                    $state.db.inventoryItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$InventoryPriceHistoriesTableOrderingComposer get unitPriceHistoryId {
    final $$InventoryPriceHistoriesTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.unitPriceHistoryId,
            referencedTable: $state.db.inventoryPriceHistories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$InventoryPriceHistoriesTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.inventoryPriceHistories,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get buyerId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get sellerId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sellerId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function(
        {bool inventoryId,
        bool unitPriceHistoryId,
        bool buyerId,
        bool sellerId})> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> invoiceNumber = const Value.absent(),
            Value<int> inventoryId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<int> unitPriceHistoryId = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<int> buyerId = const Value.absent(),
            Value<int> sellerId = const Value.absent(),
            Value<PaymentMethod> paymentMethod = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            invoiceNumber: invoiceNumber,
            inventoryId: inventoryId,
            quantity: quantity,
            unitPrice: unitPrice,
            unitPriceHistoryId: unitPriceHistoryId,
            totalPrice: totalPrice,
            buyerId: buyerId,
            sellerId: sellerId,
            paymentMethod: paymentMethod,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String invoiceNumber,
            required int inventoryId,
            required int quantity,
            required double unitPrice,
            required int unitPriceHistoryId,
            required double totalPrice,
            required int buyerId,
            required int sellerId,
            required PaymentMethod paymentMethod,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            invoiceNumber: invoiceNumber,
            inventoryId: inventoryId,
            quantity: quantity,
            unitPrice: unitPrice,
            unitPriceHistoryId: unitPriceHistoryId,
            totalPrice: totalPrice,
            buyerId: buyerId,
            sellerId: sellerId,
            paymentMethod: paymentMethod,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {inventoryId = false,
              unitPriceHistoryId = false,
              buyerId = false,
              sellerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (inventoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.inventoryId,
                    referencedTable:
                        $$TransactionsTableReferences._inventoryIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._inventoryIdTable(db).id,
                  ) as T;
                }
                if (unitPriceHistoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.unitPriceHistoryId,
                    referencedTable: $$TransactionsTableReferences
                        ._unitPriceHistoryIdTable(db),
                    referencedColumn: $$TransactionsTableReferences
                        ._unitPriceHistoryIdTable(db)
                        .id,
                  ) as T;
                }
                if (buyerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.buyerId,
                    referencedTable:
                        $$TransactionsTableReferences._buyerIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._buyerIdTable(db).id,
                  ) as T;
                }
                if (sellerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sellerId,
                    referencedTable:
                        $$TransactionsTableReferences._sellerIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._sellerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function(
        {bool inventoryId,
        bool unitPriceHistoryId,
        bool buyerId,
        bool sellerId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RolesTableTableManager get roles =>
      $$RolesTableTableManager(_db, _db.roles);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$InventoryItemsTableTableManager get inventoryItems =>
      $$InventoryItemsTableTableManager(_db, _db.inventoryItems);
  $$InventoryPriceHistoriesTableTableManager get inventoryPriceHistories =>
      $$InventoryPriceHistoriesTableTableManager(
          _db, _db.inventoryPriceHistories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
