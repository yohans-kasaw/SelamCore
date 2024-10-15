import 'package:drift/drift.dart';

/// Define the InventoryType enum
enum InventoryType { EndProduct, RawMaterial }

class InventoryTypeConverter extends TypeConverter<InventoryType, String> {
  const InventoryTypeConverter();

  @override
  InventoryType fromSql(String fromDb) {
    try {
      return InventoryType.values.firstWhere(
        (e) => e.name == fromDb,
        orElse: () => throw Exception('Unknown InventoryType: $fromDb'),
      );
    } catch (e) {
      throw Exception('Error converting "$fromDb" to InventoryType: $e');
    }
  }

  @override
  String toSql(InventoryType value) {
    return value.name;
  }
}
