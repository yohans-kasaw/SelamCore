import 'package:drift/drift.dart';

enum PaymentMethod { Cash, Bank }

class PaymentMethodConverter extends TypeConverter<PaymentMethod, String> {
  const PaymentMethodConverter();

  @override
  PaymentMethod fromSql(String fromDb) {
    try {
      return PaymentMethod.values.firstWhere(
        (e) => e.name == fromDb,
        orElse: () => throw Exception('Unknown PaymentMethod: $fromDb'),
      );
    } catch (e) {
      throw Exception('Error converting "$fromDb" to PaymentMethod: $e');
    }
  }

  @override
  String toSql(PaymentMethod value) {
    return value.name;
  }
}
