
import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class todo {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool iscomepleted;

  todo({required this.title, required this.iscomepleted});
}