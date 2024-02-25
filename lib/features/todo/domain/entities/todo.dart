import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? completedAt;
  final DateTime? reminderAt;

  const Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.createdAt,
      required this.updatedAt,
      required this.completedAt,
      required this.reminderAt});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
        createdAt,
        updatedAt,
        completedAt,
        reminderAt
      ];
}
