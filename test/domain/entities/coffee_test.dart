import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create Coffee object', () {
    final coffee = Coffee(file: 'coffee.jpg');

    expect(coffee.file, 'coffee.jpg');
  });
}
