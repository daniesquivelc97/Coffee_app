import 'package:isar/isar.dart';

part 'coffee.g.dart';

@collection
class Coffee {
  Id? isarId;
  final String file;

  Coffee({required this.file});
}
