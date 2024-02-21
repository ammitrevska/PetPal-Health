import 'package:petpal/enum/TaskCategory.dart';

class Task {
  String name;
  DateTime date;
  TaskCategory category;
  int frequency;

  Task(
      {required this.name,
      required this.date,
      required this.category,
      required this.frequency});
}
